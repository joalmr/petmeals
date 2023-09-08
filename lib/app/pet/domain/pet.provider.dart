import 'package:comfypet/app/pet/data/local/pets_list.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  PetProvider() {
    myPet(petsTest.first);
  }

  PetModel? pet;

  void myPet(PetModel myPet) async {
    pet = myPet;
    notifyListeners();
  }
}
