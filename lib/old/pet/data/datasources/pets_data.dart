import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/old/pet/data/datasources/image_storage.dart';
import 'package:petmeals/old/pet/data/models/attentions_model.dart';
import 'package:petmeals/old/pet/data/models/pet_model.dart';
import 'package:petmeals/old/pet/domain/repositories/pet_repository.dart';

class PetsData implements PetRepository {
  final ref = FirebaseFirestore.instance.collection('pets').withConverter(
        fromFirestore: (snapshot, _) {
          final pet = PetModel.fromJson(snapshot.data()!);
          final newPet = pet.copyWith(id: snapshot.id);
          return newPet;
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  @override
  Stream<List<PetModel>> loadPets(String userId) {
    return ref
        .where('userId', arrayContains: userId)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
    //* carga en tiempo real
  }

  @override
  Future<List<PetModel>> getPets(String userId) async {
    final docs = await ref
        .where('userId', arrayContains: userId)
        .get()
        .then((value) => value.docs);

    return docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<PetModel> addPet(PetModel newPet, File image) async {
    try {
      return await ref
          .add(newPet)
          .then((value) => value.get())
          .then((value) => value.data())
          .then((tmpPet) async {
        String imgStorage = "";
        imgStorage = await uploadImage(image, tmpPet!.id!);

        return ref
            .doc(tmpPet.id)
            .update(tmpPet.copyWith(photo: imgStorage).toJson())
            .then((e) => tmpPet);
      });
    } catch (e) {
      Logger().e('addPet', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<PetModel> updatePet(PetModel pet, String userId, File? image) async {
    try {
      String imgStorage = "";
      PetModel petUpdate = pet;

      if (image != null) {
        imgStorage = await uploadImage(image, pet.id!);
        petUpdate = pet.copyWith(photo: imgStorage);
      }

      final refDoc = ref.doc(pet.id);
      return refDoc.update(petUpdate.toJson()).then((value) => petUpdate);
    } catch (e) {
      Logger().e('updatePet', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<void> deletePet(String petId) async {
    try {
      deleteImage(petId); //* elimina foto del storage
      ref
          .doc(petId)
          .delete() //* elimina documento
          .then((value) => true);
    } catch (e) {
      Logger().e('deletePet', error: e);
    }
  }

  @override
  Future<List<AttentionsModel>> getNextAttentions(String petId) async {
    final docs = await ref
        .doc(petId)
        .collection('attentions')
        .orderBy('date', descending: true)
        .get()
        .then((value) => value.docs);

    final myAttentions = docs.map((doc) {
      final att = AttentionsModel.fromJson(doc.data());
      final newAtt = att.copyWith(id: doc.id);
      return newAtt;
    }).toList();

    AttentionsModel? deworming;
    AttentionsModel? grooming;
    AttentionsModel? vaccination;
    List<AttentionsModel> nextlist = [];

    if (myAttentions.isNotEmpty) {
      for (var element in myAttentions) {
        final DateTime next;
        int days = 30 * (element.nextDate ?? 0);
        next = element.date!.add(Duration(days: days));
        switch (element.type) {
          case 'deworming':
            {
              if (deworming == null) {
                deworming = element;
              } else {
                int days2 = 30 * (deworming.nextDate ?? 0);
                if (next.isBefore(deworming.date!.add(Duration(days: days2))) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  deworming = element;
                }
              }
            }
            break;
          case 'grooming':
            {
              if (grooming == null) {
                grooming = element;
              } else {
                int days2 = 30 * (grooming.nextDate ?? 0);
                if (next.isBefore(grooming.date!.add(Duration(days: days2))) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  grooming = element;
                }
              }
            }
            break;
          case 'vaccine':
            {
              if (vaccination == null) {
                vaccination = element;
              } else {
                int days2 = 30 * (vaccination.nextDate ?? 0);
                if (next.isBefore(
                        vaccination.date!.add(Duration(days: days2))) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  vaccination = element;
                }
              }
            }
            break;
          // default:
          //   return [];
        }
      }
    }

    if (deworming != null) {
      nextlist.add(deworming);
    }
    if (grooming != null) {
      nextlist.add(grooming);
    }
    if (vaccination != null) {
      nextlist.add(vaccination);
    }

    return nextlist;
  }

  @override
  Future<List<AttentionsModel>> getAttentions(String petId) async {
    final docs = await ref
        .doc(petId)
        .collection('attentions')
        // .where('type', isEqualTo: type)
        //TODO: revisar
        .orderBy('date', descending: true)
        .limit(10)
        .get()
        .then((value) => value.docs);

    final myAttentions = docs.map((doc) {
      final att = AttentionsModel.fromJson(doc.data());
      final newAtt = att.copyWith(id: doc.id);
      return newAtt;
    }).toList();

    return myAttentions;
  }

  @override
  Future<AttentionsModel> addAttention(
      AttentionsModel attention, String petId) async {
    try {
      return await ref
          .doc(petId)
          .collection('attentions')
          .add(attention.toJson())
          .then((value) => value.get())
          .then((value) => AttentionsModel.fromJson(value.data()!));
    } catch (e) {
      Logger().e('addAttention', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAttention(String id, String petId) async {
    try {
      ref.doc(petId).collection('attentions').doc(id).delete();
    } catch (e) {
      Logger().e('deleteAttention', error: e);
    }
  }
}
