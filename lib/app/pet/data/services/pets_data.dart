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

  Future<List<PetModel>> getPets() async {
    final querySnapshot = await fireRef.get();
    final pets = querySnapshot.docs.map((e) => e.data()).toList();
    return pets;
  }

  Future<void> addPeT(PetModel pet) async {
    await fireRef.add(pet);
  }
}
