import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
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
  final UpdatePetUsecase updatePetUsecase; //
  final AddAttentionUseCase addAttentionUseCase;
  final DeleteAttentionUsecase deleteAttentionUsecase;
  final GetAttentionsUsecase getAttentionsUsecase;
  final GetNextAttentionsUsecase getNextAttentionsUsecase;

  PetProvider(
    this.addPetUsecase,
    this.deletePetUsecase,
    this.getPetsUsecase,
    this.loadPetsUsecase,
    this.updatePetUsecase, //
    this.addAttentionUseCase,
    this.deleteAttentionUsecase,
    this.getAttentionsUsecase,
    this.getNextAttentionsUsecase,
  ) {
    initPetProvider();
  }

  String userId = MyStorage().uid;

  PetEntity? pet;
  List<PetEntity> pets = [];

  List<AttentionEntity> attentions = [];
  List<AttentionEntity> nextAttentions = [];

  bool loading = true;

  void initPetProvider() async {
    await getPets();
    if (pets.isNotEmpty) {
      await runPet(pets.first);
    }
    loading = false;
    notifyListeners();
  }

  Stream<List<PetEntity>> loadStream() {
    final loadingMyPets = loadPetsUsecase(global.userId ?? userId);
    return loadingMyPets;
  }

  getPets() async {
    pets = await getPetsUsecase(global.userId ?? userId);
    Logger().i(pets);
    notifyListeners();
  }

  Future<bool> addPet(PetEntity newPet, File img) async {
    final response = await addPetUsecase(newPet, img)
        .then((value) => value.id != null ? true : false);

    getPets();
    return response;
  }

  Future<PetEntity?> updatePet(PetEntity updatePet, File? img) async {
    final update = await updatePetUsecase(updatePet, img);

    getPets();
    return update;
  }

  Future<PetEntity?> foodPet(PetEntity updatePet) async {
    final petUpdated = await updatePetUsecase(updatePet, null);

    getPets();
    return petUpdated;
  }

  Future<PetEntity?> actionPet(PetEntity updatePet) async {
    final petUpdated = await updatePetUsecase(updatePet, null);

    getPets();
    return petUpdated;
  }

  deletePet(String petId) async {
    await deletePetUsecase(petId);
    getPets();
    runPet(pets.first);
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

  addAttention(AttentionEntity attention, String petId) async {
    await addAttentionUseCase(attention, petId);
    runAttentions(petId);
  }

  deleteAttention(String id, String petId) async {
    await deleteAttentionUsecase(id, petId);
    runAttentions(petId);
  }

  //Mascotas
  runPet(PetEntity myPet) {
    setPet(myPet);
    getNextAttentions(myPet.id!);
  }

  setPet(PetEntity myPet) {
    pet = myPet;
    notifyListeners();
  }

  //Atenciones
  runAttentions(String petId) {
    getAttentions(petId);
    getNextAttentions(petId);
  }

  notAttention(int index) {
    attentions.removeAt(index);
    notifyListeners();
  }
}
