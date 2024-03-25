import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/constant/constant.dart' as global;

class PetProvider extends ChangeNotifier {
  final PetUseCase petUseCase;

  PetProvider({required this.petUseCase}) {
    loadStream();
  }

  //constantes
  String userId = MyStorage().uid;
  XFile? _imagen;
  //************
  PetModel? pet; //
  List<PetModel> pets = [];
  FileImage? imageFile; //
  List<AttentionsModel> attentions = []; //
  DateTime? nextDate; //
  //************

  //Mascota
  Stream<List<PetModel>> loadStream() {
    final response = petUseCase.loadPets(global.userId ?? userId);
    response.listen((eventPets) {
      if (eventPets.isNotEmpty) {
        myPet(eventPets.first);
      }
    });

    return response;
  }

  Future<bool> addPet(PetModel newPet) {
    final img = File(_imagen!.path);

    return petUseCase.addPet(newPet, img, userId).then((value) {
      if (value) {
        _cleanPet();
      }
      return value;
    });
  }

  Future<PetModel?> updatePet(PetModel updatePet) {
    File? img;
    if (_imagen != null) {
      img = File(_imagen!.path);
    }

    return petUseCase.updatePet(updatePet, userId, img).then((value) {
      if (value != null) {
        _cleanPet();
      }
      return value;
    });
  }

  Future<PetModel?> foodPet(PetModel updatePet) async {
    return await petUseCase.foodPet(updatePet, userId).then((value) {
      if (value != null) {
        pet = value;
        notifyListeners();
      }
      return value;
    });
  }

  Future<PetModel?> actionPet(PetModel updatePet) async {
    return await petUseCase.actionPet(updatePet, userId).then((value) {
      if (value != null) {
        pet = value;
        notifyListeners();
      }
      return value;
    });
  }

  deletePet(String id) async {
    petUseCase.deletePet(id, userId);
  }

  //Atenciones
  getAttentions(String petId, String type) async {
    attentions = [];

    petUseCase.getAttentions(petId, type).then((value) {
      attentions = value['myAttentions'] as List<AttentionsModel>;
      nextDate = value['nextDate'] as DateTime?;
      notifyListeners();
    });

    Logger().i('**Lista de atenciones: $attentions');
  }

  addAttention(AttentionsModel attention, String petId) async {
    await petUseCase.addAttention(attention, petId);
  }

  deleteAttention(String id, String petId) async {
    await petUseCase.deleteAttention(id, petId);
  }

  notAttention(int index) {
    attentions.removeAt(index);
    notifyListeners();
  }

  //* Funciones
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
    _imagen = null;
    imageFile = null;
  }
}
