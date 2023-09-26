import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfypet/app/pet/data/services/firebase_storage.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';

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
    //TODO: CONSULTAR CON USER ID
    final result = fireRef.snapshots().map(
          (event) => event.docs
              .map(
                (e) => e.data(),
              )
              .toList(),
        );

    return result;
  }

  Future<bool> addPeT(PetModel pet, File image, String userId) async {
    final imgStorage = await uploadImage(image, userId);
    final petWithImg = pet.copyWith(photo: imgStorage);
    final response = await fireRef.add(petWithImg);
    if (response.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deletePet(String id, String userId) async {
    final ejec = fireRef.doc(id);
    final photoForDelete = await ejec.get().then((value) => value.data()!.photo);
    await deleteImage(photoForDelete!, userId);
    await ejec.delete();
  }
}
