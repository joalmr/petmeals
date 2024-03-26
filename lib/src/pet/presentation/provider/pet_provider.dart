import 'dart:async';
import 'dart:io';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
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
  // XFile? _imagen;
  //************
  PetModel? pet; //
  List<PetModel> pets = [];
  // FileImage? imageFile;
  List<AttentionsModel> attentions = []; //
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

  Future<bool> addPet(PetModel newPet, File img) {
    return petUseCase
        .addPet(newPet, img)
        .then((value) => value != null ? true : false);
  }

  Future<PetModel?> updatePet(PetModel updatePet, File? img) async {
    final update = await petUseCase.updatePet(updatePet, userId, img);
    return update;
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

  deletePet(String petId) async {
    petUseCase.deletePet(petId);
  }

  //Atenciones
  getAttentions(String petId, String type) async {
    attentions = [];

    attentions = await petUseCase.getAttentions(petId, type);
    notifyListeners();
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
}
