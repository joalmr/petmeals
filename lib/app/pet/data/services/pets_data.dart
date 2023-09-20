import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Future<List<PetModel>> getPets(String idUser) async {
  //   log(idUser);
  //   // .where("user_id", arrayContains: idUser)
  //   final pets = fireRef.get().then(
  //         (value) => value.docs
  //             .map(
  //               (e) => e.data(),
  //             )
  //             .toList(),
  //       );

  //   return pets;
  // }

  Stream<List<PetModel>> getPetStream(String idUser) {
    final result = fireRef.snapshots().map(
          (event) => event.docs
              .map(
                (e) => e.data(),
              )
              .toList(),
        );

    return result;
  }

  Future<bool> addPeT(PetModel pet) async {
    final response = await fireRef.add(pet);
    if (response.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deletePet(String id) async {
    await fireRef.doc(id).delete();
  }
}
