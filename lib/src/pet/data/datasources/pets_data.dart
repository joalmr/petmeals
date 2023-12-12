import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/datasources/firebase_storage.dart';

import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetsData implements PetRepository {
  final fireRef = FirebaseFirestore.instance.collection('pets').withConverter(
        fromFirestore: (snapshot, _) {
          final pet = PetModel.fromJson(snapshot.data()!);
          final newPet = pet.copyWith(id: snapshot.id);
          return newPet;
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  @override
  Future<PetModel?> actionPet(PetModel pet, String userId) async {
    try {
      PetModel petAction = pet;
      return await fireRef
          .doc(pet.id)
          .update(pet.toJson())
          .then((value) => petAction);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  @override
  Future<bool> addPet(PetModel newPet, File image, String userId) async {
    try {
      final imgStorage = await uploadImage(image, userId);
      final petWithImg = newPet.copyWith(photo: imgStorage);
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

  @override
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

  @override
  Future<PetModel?> foodPet(PetModel pet, String userId) async {
    try {
      PetModel petFood = pet;
      return await fireRef
          .doc(pet.id)
          .update(pet.toJson())
          .then((value) => petFood);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  @override
  Stream<List<PetModel>> loadStream(String userId) {
    final result = fireRef
        .where(
          'userId',
          arrayContains: userId,
        )
        .snapshots()
        .map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );

    return result;
  }

  @override
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img) async {
    try {
      String imgStorage = "";
      PetModel petWithImg = pet;
      if (img != null) {
        imgStorage = await uploadImage(img, userId);
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
}
