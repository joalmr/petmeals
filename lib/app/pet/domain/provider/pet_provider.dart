import 'dart:developer';
import 'package:comfypet/app/pet/data/local/pets_local.dart';
import 'package:comfypet/app/pet/data/services/pets_data.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final PetsLocal petData;
  PetProvider({required this.petData}) {
    getPets();
  }

  PetsData petsData = PetsData();

  List<PetModel> myPets = [];
  PetModel? pet;

  Future<void> getPets() async {
    final dataPet = await petsData.getPets();
    inspect(dataPet);

    myPets = dataPet;
    pet = dataPet.first;
    notifyListeners();
  }

  void myPet(PetModel myPet) async {
    pet = myPet;
    inspect(pet);
    notifyListeners();
  }
}
