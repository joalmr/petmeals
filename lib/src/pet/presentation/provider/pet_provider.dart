import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';

class PetProvider extends ChangeNotifier {
  final PetUseCase petUseCase;

  PetProvider({required this.petUseCase}) {
    MyStorage().box.listen(() {
      userId = MyStorage().uid;
      loadStream().listen((event) {
        if (event.isNotEmpty) {
          myPet(event.first);
        }
      });
    });

    loadStream().listen((event) {
      if (event.isNotEmpty) {
        myPet(event.first);
      }
    });
    // notifyListeners();
  }

  // StreamSubscription<dynamic>? subscriptionLoad;

  String userId = MyStorage().uid;
  PetModel? pet;
  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;
  XFile? _imagen;
  FileImage? imageFile;

  //cargar mascota por usuario
  Stream<List<PetModel>> loadStream() => petUseCase.loadPets(userId);

  getAttentions(String petId) async {
    final response = await petUseCase.getAttentions(petId);
    Logger().i('**Lista de atenciones: $response');
  }

  //agregar mascota por usuario
  Future<void> addPet(PetModel? newPet) {
    final addPet = newPet!.copyWith(
      borndate: borndate,
      specie: specie,
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );
    final img = File(_imagen!.path);

    return petUseCase.addPet(addPet, img, userId).then((value) {
      if (value) {
        _cleanPet();
      }
    });
  }

  //editar mascota por usuario
  Future<PetModel?> updatePet(PetModel updatePet) {
    File? img;
    if (_imagen != null) {
      img = File(_imagen!.path);
    }
    final updPet = updatePet.copyWith(
      borndate: borndate,
      specie: specie,
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );

    return petUseCase.updatePet(updPet, userId, img).then((value) {
      if (value != null) {
        _cleanPet();
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

  //eliminar mascota por usuario
  Future<void> deletePet(String id) async {
    await petUseCase.deletePet(id, userId).then((value) => _cleanPet());
  }

  //* funciones
  //actualizar el modelo de mascota para mostrar
  void myPet(PetModel myPet) {
    pet = myPet;
    notifyListeners();
  }

  //cambiar imagen para mascota
  void procesarImagen(ImageSource origen) async {
    _imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    imageFile = FileImage(File(_imagen!.path));
    notifyListeners();
  }

  //limpiar
  void _cleanPet() {
    specie = 0;
    sex = false;
    borndate = DateTime.now();
    sterillized = false;
    _imagen = null;
    imageFile = null;
  }
}
