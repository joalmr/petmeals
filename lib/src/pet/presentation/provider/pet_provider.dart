import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/data/models/specie_model.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';

class PetProvider extends ChangeNotifier {
  final PetUseCase petUseCase;

  PetProvider({required this.petUseCase}) {
    // MyStorage().box.listen(() {
    //   //first login
    //   userId = MyStorage().uid;
    //   loadStream().listen((event) {
    //     if (event.isNotEmpty) {
    //       pet = event.first;
    //     }
    //   });

    //   notifyListeners();
    // });
    //storage
    loadStream().listen((event) {
      if (event.isNotEmpty) {
        pet = event.first;
      }
    });

    // subscriptionLoad = loadStream().listen((event) {});
  }

  StreamSubscription<dynamic>? subscriptionLoad;

  String userId = MyStorage().uid; //? OBTIENE USER ID
  List<PetModel> myPets = [];
  PetModel? pet;
  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;
  XFile? _imagen;
  FileImage? imageFile;

  final specieJson = {
    0: Specie(id: '0', name: 'Gato'),
    1: Specie(id: '1', name: 'Perro'),
  };

  Stream<List<PetModel>> loadStream() => petUseCase.loadStream(userId);

  Future<bool> addPet(PetModel? newPet) {
    final addPet = newPet!.copyWith(
      borndate: borndate,
      specie: specieJson[specie]!,
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );
    final img = File(_imagen!.path);

    return petUseCase.addPet(addPet, img, userId).then((value) {
      if (value) {
        specie = 0;
        sex = false;
        borndate = DateTime.now();
        sterillized = false;
        _imagen = null;
        imageFile = null;
      }
      return value;
    });
  }

  Future<PetModel?> updatePet(PetModel updatePet) {
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

    return petUseCase.updatePet(updPet, userId, img).then((value) {
      if (value != null) {
        specie = 0;
        sex = false;
        borndate = DateTime.now();
        sterillized = false;
        _imagen = null;
        imageFile = null;
      }
      return value;
    });
  }

  //registra los horarios de comidas
  Future<PetModel?> foodPet(PetModel updatePet) async {
    return await petUseCase.foodPet(updatePet, userId).then((value) {
      if (value != null) {
        pet = value;
        notifyListeners();
        Logger().i('Comida registrada');
      }
      return value;
    });
  }

//registra los horarios de actividades
  Future<PetModel?> actionPet(PetModel updatePet) async {
    return await petUseCase.actionPet(updatePet, userId).then((value) {
      if (value != null) {
        pet = value;
        notifyListeners();
        Logger().i('Acción registrada');
      }
      return value;
    });
  }

  Future<void> deletePet(String id) async {
    //TODO: APUNTAR A USECASE
    await petUseCase.deletePet(id, userId);
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

  //* funciones
  void myPet(PetModel myPet) {
    pet = myPet;
    notifyListeners();
  }

  void procesarImagen(ImageSource origen) async {
    _imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    imageFile = FileImage(File(_imagen!.path));
    notifyListeners();
  }
}
