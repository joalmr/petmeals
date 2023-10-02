import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  final PetsData petData;
  PetCubit({required this.petData}) : super(PetInitial()) {
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

  XFile? imagen;
  FileImage? imageFile;

  Stream<List<PetModel>> loadStream() => petData.getPetStream(userId);

  void myPet(PetModel myPet) => pet = myPet;

  void addPet(PetModel? newPet) async {
    emit(PetLoading());

    newPet = PetModel(
      name: newPet?.name,
      borndate: borndate,
      specie: specieJson[specie],
      sex: sex,
      sterillized: sterillized,
      userId: [userId],
    );

    final img = File(imagen!.path);
    final response = await petData.addPeT(newPet, img, userId);

    if (response) {
      // controllerDate.text = '';
      // controllerName.text = '';
      specie = 0;
      sex = false;
      borndate = DateTime.now();
      sterillized = false;
      imagen = null;
      imageFile = null;
    }

    emit(PetAdded());
  }

  void deletePet(String id) async {
    emit(PetLoading());
    await petData.deletePet(id, userId);
    pet = myPets.first;
    emit(PetDeleted());
  }

  void procesarImagen(ImageSource origen) async {
    imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    imageFile = FileImage(File(imagen!.path));
  }
}
