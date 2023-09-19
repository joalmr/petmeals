import 'dart:developer';
import 'package:comfypet/app/pet/data/services/pets_data.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final PetsData petData;
  final UserProvider userProvider;
  PetProvider({required this.userProvider, required this.petData}) {
    getPets();
  }

  // PetsData petsData = PetsData();

  List<PetModel> myPets = [];
  PetModel? pet;

  Future<void> getPets() async {
    final dataPet = await petData.getPets("mNbVSbRK5gYCuzkwOdaKKi5eeAK2");
    inspect(dataPet);

    myPets = dataPet;
    pet = dataPet.first;
    notifyListeners();
  }

  void myPet(PetModel myPet) async {
    pet = myPet;
    notifyListeners();
  }

  addPet(PetModel newPet) {
    petData.addPeT(newPet);
  }
}
