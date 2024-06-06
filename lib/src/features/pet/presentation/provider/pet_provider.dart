import 'dart:async';
import 'dart:io';
import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/old/pet/data/models/attentions_model.dart';
import 'package:petmeals/old/pet/data/models/pet_model.dart';
import 'package:petmeals/old/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/core/utils/constant/constant.dart' as global;

class PetProvider extends ChangeNotifier {
  final PetUseCase petUseCase;

  PetProvider({required this.petUseCase}) {
    loadStream();
  }

  String userId = MyStorage().uid;
  //************
  PetModel? pet; //
  List<AttentionsModel> attentions = []; //
  List<AttentionsModel> nextAttentions = []; //
  //************

  //Mascota
  Stream<List<PetModel>> loadStream() {
    final response = petUseCase.loadPets(global.userId ?? userId);
    response.listen((eventPets) {
      if (eventPets.isNotEmpty) {
        myPet(eventPets.first);
        getNextAttentions(eventPets.first.id!);
      }
    });

    return response;
  }

  Future<bool> addPet(PetModel newPet, File img) {
    return petUseCase
        .addPet(newPet, img)
        .then((value) => value.id != null ? true : false);
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
  runAttentions(String petId) {
    getAttentions(petId);
    // getNextAttentions(petId);
  }

  getAttentions(String petId) async {
    attentions = [];

    attentions = await petUseCase.getAttentions(petId);
    notifyListeners();
  }

  getNextAttentions(String petId) async {
    nextAttentions = [];

    nextAttentions = await petUseCase.getNextAttentions(petId);
    notifyListeners();
  }

  addAttention(AttentionsModel attention, String petId) async {
    await petUseCase.addAttention(attention, petId);
    runAttentions(petId);
  }

  deleteAttention(String id, String petId) async {
    await petUseCase.deleteAttention(id, petId);
    runAttentions(petId);
  }

  //* Funciones
  notAttention(int index) {
    attentions.removeAt(index);
    notifyListeners();
  }

  void myPet(PetModel myPet) {
    pet = myPet;
    getNextAttentions(myPet.id!);
    notifyListeners();
  }
}
