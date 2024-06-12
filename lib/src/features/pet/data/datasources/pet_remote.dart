import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petmeals/src/core/error/failure.dart';
import 'package:petmeals/src/features/pet/data/datasources/_image_storage.dart';
import 'package:petmeals/src/features/pet/data/models/pet_model.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';

abstract class PetRemoteDataSource {
  Stream<List<PetModel>> loadPets(String userId);
  Future<List<PetModel>> getPets(String userId);
  Future<PetModel> addPet(PetEntity newPet, File image);
  Future<PetModel> updatePet(PetEntity pet, File? image);
  Future<void> deletePet(String petId);
}

class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  final ref = FirebaseFirestore.instance.collection('pets').withConverter(
        fromFirestore: (snapshot, _) {
          final pet = PetModel.fromJson(snapshot.data()!);
          final newPet = pet.copyWith(id: snapshot.id);
          return newPet;
        },
        toFirestore: (pet, _) => pet.toJson(),
      );

  @override
  Future<PetModel> addPet(PetEntity newPet, File image) async {
    try {
      return await ref
          .add(PetModel.fromEntity(newPet))
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
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
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
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<List<PetModel>> getPets(String userId) async {
    return [];
  }

  @override
  Stream<List<PetModel>> loadPets(String userId) {
    return ref
        .where('userId', arrayContains: userId)
        .orderBy('borndate', descending: false)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  @override
  Future<PetModel> updatePet(PetEntity pet, File? image) async {
    try {
      String? imgStorage;

      imgStorage = await uploadImage(image, pet.id!);

      return ref
          .doc(pet.id)
          .update(imgStorage.isNotEmpty
              ? PetModel.fromEntity(pet).copyWith(photo: imgStorage).toJson()
              : PetModel.fromEntity(pet).toJson())
          .then((value) => PetModel.fromEntity(pet));
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}
