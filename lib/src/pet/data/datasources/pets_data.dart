import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/datasources/firebase_storage.dart';

import 'package:petmeals/src/pet/data/models/pet_model.dart';

class PetsData {
  final fireRef = FirebaseFirestore.instance.collection('pets').withConverter(
        fromFirestore: (snapshot, _) {
          final pet = PetModel.fromJson(snapshot.data()!);
          final newPet = pet.copyWith(id: snapshot.id);
          return newPet;
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  Stream<List<PetModel>> getPetStream(String idUser) {
    final result = fireRef
        .where(
          'userId',
          arrayContains: idUser,
        )
        .snapshots()
        .map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );

    return result;
  }

  Future<PetModel> getPet(String pet) async {
    final result = await fireRef.doc(pet).get();
    return result.data()!;
  }

  Future<bool> addPet(PetModel pet, File image, String userId) async {
    try {
      final imgStorage = await uploadImage(image, userId);
      final petWithImg = pet.copyWith(photo: imgStorage);
      final response = await fireRef.add(petWithImg);
      if (response.id.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  Future<PetModel?> updatePet(PetModel pet, File? image, String userId) async {
    try {
      String imgStorage = "";
      PetModel petWithImg = pet;
      if (image != null) {
        imgStorage = await uploadImage(image, userId);
        petWithImg = pet.copyWith(photo: imgStorage);
      }

      return await fireRef
          .doc(pet.id)
          .update(petWithImg.toJson())
          .then((value) => petWithImg);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> deletePet(String id, String userId) async {
    try {
      final ejec = fireRef.doc(id);
      final photoForDelete =
          await ejec.get().then((value) => value.data()!.photo);
      deleteImage(photoForDelete!, userId);
      await ejec.delete();
    } catch (e) {
      Logger().e(e);
    }
  }
}
