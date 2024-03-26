import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/datasources/image_storage.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

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
  Future<List<AttentionsModel>> getAttentions(String petId, String type) async {
    final docs = await ref
        .doc(petId)
        .collection('attentions')
        .where('type', isEqualTo: type)
        .orderBy('date', descending: true)
        .get()
        .then((value) => value.docs);

    // final attentions =
    //     docs.map((e) => AttentionsModel.fromJson(e.data())).toList();

    // DateTime? nextDate;
    // if (attentions.isNotEmpty) {
    //   nextDate = attentions.first.date!.add(
    //     Duration(
    //       days: attentions.first.nextDate! * 30,
    //     ),
    //   );

    //   for (var element in attentions) {
    //     final DateTime next;
    //     int days = 30 * (element.nextDate ?? 0);
    //     next = element.date!.add(Duration(days: days));

    //     if (next.isBefore(nextDate!)) {
    //       nextDate = next;
    //     }
    //   }
    // }

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
