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
}
