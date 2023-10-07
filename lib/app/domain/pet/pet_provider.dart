import 'dart:io';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PetProvider extends ChangeNotifier {
  final PetsData petData;

  PetProvider({required this.petData}) {
    loadStream().listen((event) {
      myPets = event;
      pet = myPets.first;
    });
  }

  String userId = MyStorage().uid;
  //? OBTIENE USER ID

  List<PetModel> myPets = [];
  PetModel? pet;

  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;
  Map<int, Specie> specieJson = {
    0: Specie(id: '0', name: 'Gato'),
    1: Specie(id: '1', name: 'Perro'),
  };

  XFile? _imagen;
  FileImage? imageFile;

  Stream<List<PetModel>> loadStream() => petData.getPetStream(userId);

  void myPet(PetModel myPet) async {
    pet = myPet;
    notifyListeners();
  }

  Future<bool> addPet(PetModel? newPet) async {
    newPet = PetModel(
      name: newPet?.name,
      borndate: borndate,
      specie: specieJson[specie],
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );
    final img = File(_imagen!.path);
    final response = await petData.addPeT(newPet, img, userId);
    if (response) {
      specie = 0;
      sex = false;
      borndate = DateTime.now();
      sterillized = false;
      _imagen = null;
      imageFile = null;
    }

    return response;
  }

  Future<void> deletePet(String id) async {
    await petData.deletePet(id, userId);
    pet = myPets.first;
    notifyListeners();
  }

  void procesarImagen(ImageSource origen) async {
    _imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    imageFile = FileImage(File(_imagen!.path));
    notifyListeners();
  }
}
