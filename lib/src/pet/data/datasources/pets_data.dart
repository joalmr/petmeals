import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/datasources/image_storage.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetsData implements PetRepository {
  final ref = FirebaseFirestore.instance.collection('pets');

  @override
  Future<bool> addPet(PetModel newPet, File image, String userId) async {
    try {
      final imgStorage = await uploadImage(image, userId);
      final petWithImg = newPet.copyWith(photo: imgStorage);

      return ref
          .add(petWithImg.toJson())
          .then((value) => value.get())
          .then((value) {
        if (value.data() != null) {
          return true;
        } else {
          return false;
        }
      });
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  @override
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img) async {
    try {
      String imgStorage = "";
      PetModel petUpdate = pet;

      if (img != null) {
        imgStorage = await uploadImage(img, userId);
        petUpdate = pet.copyWith(photo: imgStorage);
      }

      final refDoc = ref.doc(pet.id);
      return refDoc.update(petUpdate.toJson()).then((value) => petUpdate);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  @override
  Future<void> deletePet(String id, String userId) async {
    try {
      final refDoc = ref.doc(id);
      refDoc
          .get()
          .then((value) => PetModel.fromJson(value.data()!))
          .then((value) => value.photo) //* obtiene foto
          .then((value) =>
              deleteImage(value!, userId)) //* elimina foto del storage
          .then((value) => refDoc.delete()); //* elimina documento
    } catch (e) {
      Logger().e(e);
    }
  }

  @override
  Stream<List<PetModel>> loadPets(String userId) {
    return ref
        .where('userId', arrayContains: userId)
        .snapshots()
        .map((event) => event.docs.map((e) {
              final pet = PetModel.fromJson(e.data());
              final newPet = pet.copyWith(id: e.id);
              return newPet;
            }).toList());
    //* carga en tiempo real
  }

  @override
  Future<List<PetModel>> getPets(String userId) async {
    final docs = await ref
        .where('userId', arrayContains: userId)
        .get()
        .then((value) => value.docs);

    return docs.map((doc) {
      final pet = PetModel.fromJson(doc.data());
      final newPet = pet.copyWith(id: doc.id);
      return newPet;
    }).toList();
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

    final attentions =
        docs.map((e) => AttentionsModel.fromJson(e.data())).toList();

    return attentions;
  }

  @override
  Future<bool> addAttention(AttentionsModel attention, String petId) async {
    try {
      return await ref
          .doc(petId)
          .collection('attentions')
          .add(attention.toJson())
          .then((value) => value.get())
          .then((value) {
        if (value.data() != null) {
          return true;
        } else {
          return false;
        }
      });
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  @override
  Future<void> deleteAttention(String id, String petId) async {
    try {
      ref.doc(petId).collection('attentions').doc(id);
    } catch (e) {
      Logger().e(e);
    }
  }
}
