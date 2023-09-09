import 'dart:developer';

import 'package:comfypet/app/pet/data/local/pets_local.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final PetsLocal petData;
  PetProvider({required this.petData}) {
    getPets();
  }

  List<PetModel> myPets = [];
  PetModel? pet;

  Future<void> getPets() async {
    myPets = await petData.getPets();
    pet = myPets.first;
    inspect(myPets);
    notifyListeners();
  }

  void myPet(PetModel myPet) async {
    pet = myPet;
    inspect(pet);
    notifyListeners();
  }
}
