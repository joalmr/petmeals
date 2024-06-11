import 'dart:async';
import 'dart:io';
import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/core/utils/constant/constant.dart' as global;
import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/add_attention_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/delete_attention_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/get_attentions_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/get_next_attentions_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/add_pet_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/delete_pet_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/get_pets_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/load_pets_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/update_pet_usecase.dart';

class PetProvider extends ChangeNotifier {
  final AddPetUsecase addPetUsecase;
  final DeletePetUsecase deletePetUsecase;
  final GetPetsUsecase getPetsUsecase;
  final LoadPetsUsecase loadPetsUsecase;
  final UpdatePetUsecase updatePetUsecase;
  final AddAttentionUseCase addAttentionUseCase;
  final DeleteAttentionUsecase deleteAttentionUsecase;
  final GetAttentionsUsecase getAttentionsUsecase;
  final GetNextAttentionsUsecase getNextAttentionsUsecase;

  PetProvider(
    this.addPetUsecase,
    this.deletePetUsecase,
    this.getPetsUsecase,
    this.loadPetsUsecase,
    this.updatePetUsecase,
    this.addAttentionUseCase,
    this.deleteAttentionUsecase,
    this.getAttentionsUsecase,
    this.getNextAttentionsUsecase,
  ) {
    // loadStream();
  }

  String userId = MyStorage().uid;
  //************
  PetEntity? pet; //
  List<Attention> attentions = []; //
  List<Attention> nextAttentions = []; //
  //************

  //Mascota
  Stream<List<PetEntity>> loadStream() {
    final response = loadPetsUsecase(global.userId ?? userId);
    response.listen((eventPets) {
      if (eventPets.isNotEmpty) {
        myPet(eventPets.first);
        getNextAttentions(eventPets.first.id!);
      }
    });
    return response;
  }

  Future<bool> addPet(PetEntity newPet, File img) {
    return addPetUsecase(newPet, img)
        .then((value) => value.id != null ? true : false);
  }

  Future<PetEntity?> updatePet(PetEntity updatePet, File? img) async {
    final update = await updatePetUsecase(updatePet, userId, img);
    return update;
  }

  Future<PetEntity?> foodPet(PetEntity updatePet) async {
    return await updatePetUsecase(updatePet, userId, null).then((value) {
      pet = value;
      notifyListeners();
      return value;
    });
  }

  Future<PetEntity?> actionPet(PetEntity updatePet) async {
    return await updatePetUsecase(updatePet, userId, null).then((value) {
      pet = value;
      notifyListeners();
      return value;
    });
  }

  deletePet(String petId) async {
    deletePetUsecase(petId);
  }

  //Atenciones
  runAttentions(String petId) {
    getAttentions(petId);
    // getNextAttentions(petId);
  }

  getAttentions(String petId) async {
    attentions = [];

    attentions = await getAttentionsUsecase(petId);
    notifyListeners();
  }

  getNextAttentions(String petId) async {
    nextAttentions = [];

    nextAttentions = await getNextAttentionsUsecase(petId);
    notifyListeners();
  }

  addAttention(Attention attention, String petId) async {
    await addAttentionUseCase(attention, petId);
    runAttentions(petId);
  }

  deleteAttention(String id, String petId) async {
    await deleteAttentionUsecase(id, petId);
    runAttentions(petId);
  }

  //* Funciones
  notAttention(int index) {
    attentions.removeAt(index);
    notifyListeners();
  }

  void myPet(PetEntity myPet) {
    pet = myPet;
    getNextAttentions(myPet.id!);
    notifyListeners();
  }
}
