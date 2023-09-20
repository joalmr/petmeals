import 'package:comfypet/app/pet/data/services/pets_data.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final PetsData petData;
  final UserProvider userProvider;
  PetProvider({required this.userProvider, required this.petData}) {
    loadStream();
  }

  // PetsData petsData = PetsData();

  List<PetModel> myPets = [];
  PetModel? pet;

  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now(); //
  bool sterillized = false;
  // List<String>? userId;
  // String? photo;
  Map<int, Specie> specieJson = {
    0: Specie(id: "0", name: "Gato"),
    1: Specie(id: "1", name: "Perro"),
  };

  // Future<void> getPets() async {
  //   final dataPet = await petData.getPets("mNbVSbRK5gYCuzkwOdaKKi5eeAK2");
  //   inspect(dataPet);

  //   myPets = dataPet;
  //   pet = dataPet.first;
  //   notifyListeners();
  // }

  Stream<List<PetModel>> loadStream() => petData.getPetStream("mNbVSbRK5gYCuzkwOdaKKi5eeAK2");

  void myPet(PetModel myPet) async {
    pet = myPet;

    notifyListeners();
  }

  Future<bool> addPet(PetModel newPet) async {
    final myPet = newPet.copyWith(
      borndate: borndate,
      specie: specieJson[specie],
      sex: sex,
      sterillized: sterillized,
      userId: ["mNbVSbRK5gYCuzkwOdaKKi5eeAK2"],
      photo:
          "https://as01.epimg.net/diarioas/imagenes/2022/01/09/actualidad/1641723199_369382_1641723267_noticia_normal.jpg",
    );
    final response = await petData.addPeT(myPet);
    return response;
  }

  Future<void> deletePet(String id) async {
    await petData.deletePet(id);
  }
}
