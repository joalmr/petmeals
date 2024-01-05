import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/datasources/image_storage.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetsData implements PetRepository {
  // final fireRef = FirebaseFirestore.instance.collection('pets').withConverter(
  //       fromFirestore: (snapshot, _) {
  //         final pet = PetModel.fromJson(snapshot.data()!);
  //         final newPet = pet.copyWith(id: snapshot.id);
  //         return newPet;
  //       },
  //       toFirestore: (pet, _) => pet.toJson(),
  //     );
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
  Stream<List<PetModel>> loadStream(String userId) {
    return ref
        .where('userId', arrayContains: userId)
        // .orderBy('created_at', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) {
              final pet = PetModel.fromJson(e.data());
              final newPet = pet.copyWith(id: e.id);
              return newPet;
            }).toList());
    //* carga en tiempo real
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
}
