import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:petmeals/src/infrastructure/request_status.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';

part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  PetCubit(this.petUseCase) : super(const PetState());
  final PetUseCase petUseCase;

  String userId = MyStorage().uid;
  XFile? imagen;

  //Mascotas
  Stream<List<PetModel>> loadStream() => petUseCase.loadPets(userId);

  Future<bool> addPet(PetModel newPet) {
    final img = File(imagen!.path);

    return petUseCase.addPet(newPet, img, userId).then((value) {
      if (value) {
        _cleanPet();
      }
      return value;
    });
  }

  Future<PetModel?> updatePet(PetModel updatePet) {
    File? img;
    if (imagen != null) {
      img = File(imagen!.path);
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
        emit(state.copyWith(pet: value));
      }
      return value;
    });
  }

  Future<PetModel?> actionPet(PetModel updatePet) async {
    return await petUseCase.actionPet(updatePet, userId).then((value) {
      if (value != null) {
        emit(state.copyWith(pet: value));
      }
      return value;
    });
  }

  deletePet(String id) async {
    await petUseCase.deletePet(id, userId).then((value) => _cleanPet());
  }

  //Atenciones
  getAttentions(String petId, String type) async {
    emit(state.copyWith(status: RequestStatus.loading));

    petUseCase.getAttentions(petId, type).then((value) {
      emit(state.copyWith(
        status: RequestStatus.success,
        attentions: value['myAttentions'] as List<AttentionsModel>,
        nextDate: value['nextDate'] as DateTime?,
      ));
    });
  }

  addAttention(AttentionsModel attention, String petId) async {
    await petUseCase.addAttention(attention, petId);
  }

  deleteAttention(String id, String petId) async {
    await petUseCase.deleteAttention(id, petId);
  }

  //Funciones
  void myPet(PetModel myPet) {
    emit(state.copyWith(pet: myPet));
  }

  void procesarImagen(ImageSource origen) async {
    imagen = await ImagePicker().pickImage(source: origen, imageQuality: 80);
    emit(state.copyWith(imageFile: FileImage(File(imagen!.path))));
  }

  _cleanPet() {
    imagen = null;
    state.copyWith(imageFile: null);
  }
}
