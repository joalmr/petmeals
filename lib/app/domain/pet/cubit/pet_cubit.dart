import 'dart:io';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  final PetsData petData;
  PetCubit({required this.petData}) : super(PetInitial()) {
    loadStream().listen((event) {
      state.myPets = event;
      state.pet = state.myPets.first;
    });
  }

  Stream<List<PetModel>> loadStream() => petData.getPetStream(state.userId);

  void myPet(PetModel myPet) => emit(PetSelected(myPet));

  void addPet(PetModel? newPet) async {
    newPet = PetModel(
      name: newPet?.name,
      borndate: state.borndate,
      specie: state.specieJson[state.specie],
      sex: state.sex,
      sterillized: state.sterillized,
      userId: [state.userId],
    );

    final img = File(state.imagen!.path);
    final response = await petData.addPeT(newPet, img, state.userId);

    if (response != null) {
      state.specie = 0;
      state.sex = false;
      state.borndate = DateTime.now();
      state.sterillized = false;
      state.imagen = null;
      state.imageFile = null;

      emit(PetAdded(response));
    }
  }

  void deletePet(String id) async {
    await petData.deletePet(id, state.userId);

    emit(PetDeleted(state.myPets.first));
  }

  Future<XFile?> procesarImagen(ImageSource origen) async {
    final imagen =
        await ImagePicker().pickImage(source: origen, imageQuality: 80);
    // final imageFile = FileImage(File(state.imagen!.path));
    return imagen;
  }

  void changeImage(XFile image) {
    final imageFile = FileImage(File(image.path));
    emit(PetAddImg(image, imageFile));
  }
}
