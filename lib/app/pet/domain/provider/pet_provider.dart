import 'dart:io';
import 'package:comfypet/app/pet/data/services/pets_data.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PetProvider extends ChangeNotifier {
  final PetsData petData;
  final UserProvider userProvider;
  PetProvider({required this.userProvider, required this.petData}) {
    loadStream().listen((event) {
      myPets = event;
      pet = myPets.first;
    });
  }

  List<PetModel> myPets = [];
  PetModel? pet;

  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;
  Map<int, Specie> specieJson = {
    0: Specie(id: "0", name: "Gato"),
    1: Specie(id: "1", name: "Perro"),
  };

  XFile? imagen;
  FileImage? imageFile;

  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();

  // "mNbVSbRK5gYCuzkwOdaKKi5eeAK2"
  Stream<List<PetModel>> loadStream() => petData.getPetStream("");

  void myPet(PetModel myPet) async {
    pet = myPet;
    notifyListeners();
  }

  Future<bool> addPet() async {
    PetModel newPet = PetModel(
      name: controllerName.text,
      borndate: borndate,
      specie: specieJson[specie],
      sex: sex,
      sterillized: sterillized,
      userId: ["mNbVSbRK5gYCuzkwOdaKKi5eeAK2"],
    );
    final img = File(imagen!.path);
    final response = await petData.addPeT(newPet, img, "mNbVSbRK5gYCuzkwOdaKKi5eeAK2"); //TODO: OBTENER Y MANDAR USER ID
    if (response) {
      controllerDate.text = "";
      controllerName.text = "";
      specie = 0;
      sex = false;
      borndate = DateTime.now();
      sterillized = false;
      imagen = null;
    }
    return response;
  }

  Future<void> deletePet(String id) async {
    await petData.deletePet(id);
    pet = myPets.first;
    notifyListeners();
  }

  void procesarImagen(ImageSource origen) async {
    imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);

    imageFile = FileImage(File(imagen!.path));
    notifyListeners();
  }
}
