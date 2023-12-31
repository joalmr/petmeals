import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:petmeals/app/data/pet/datasources/pets_data.dart';
import 'package:petmeals/app/data/pet/models/pet_model.dart';
import 'package:petmeals/app/data/pet/models/specie_model.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PetProvider extends ChangeNotifier {
  final PetsData petData;

  PetProvider({required this.petData}) {
    //first login
    MyStorage().box.listen(() {
      userId = MyStorage().uid;
      loadStream().listen((event) {
        if (event.isNotEmpty) {
          pet = event.first;
        }
      });

      notifyListeners();
    });
    //storage
    loadStream().listen((event) {
      if (event.isNotEmpty) {
        pet = event.first;
      }
    });
  }

  String userId = MyStorage().uid; //? OBTIENE USER ID

  List<PetModel> myPets = [];
  PetModel? pet;

  // StreamSubscription<dynamic>? subscription;

  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;

  final specieJson = {
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
    final addPet = newPet!.copyWith(
      borndate: borndate,
      specie: specieJson[specie]!,
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );

    final img = File(_imagen!.path);
    final response = await petData.addPet(addPet, img, userId);
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

  Future<PetModel?> updatePet(PetModel updatePet) async {
    File? img;
    if (_imagen != null) {
      img = File(_imagen!.path);
    }
    final updPet = updatePet.copyWith(
      borndate: borndate,
      specie: specieJson[specie]!,
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );

    final response = await petData.updatePet(updPet, img, userId);
    if (response != null) {
      specie = 0;
      sex = false;
      borndate = DateTime.now();
      sterillized = false;
      _imagen = null;
      imageFile = null;
    }
    return response;
  }

  //registra los horarios de comidas
  Future<PetModel?> foodPet(PetModel updatePet) async {
    final response = await petData.updatePet(updatePet, null, userId);
    if (response != null) {
      pet = response;
      notifyListeners();
      Logger().i('Comida registrada');
    }
    return response;
  }

//registra los horarios de actividades
  Future<PetModel?> actionPet(PetModel updatePet) async {
    final response = await petData.updatePet(updatePet, null, userId);
    if (response != null) {
      pet = response;
      notifyListeners();
      Logger().i('Acción registrada');
    }
    return response;
  }

  Future<void> deletePet(String id) async {
    await petData.deletePet(id, userId);
    specie = 0;
    sex = false;
    borndate = DateTime.now();
    sterillized = false;
    _imagen = null;
    imageFile = null;
    if (myPets.isNotEmpty) {
      pet = myPets.first;
    }
    notifyListeners();
  }

  void procesarImagen(ImageSource origen) async {
    _imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    imageFile = FileImage(File(_imagen!.path));
    notifyListeners();
  }
}
