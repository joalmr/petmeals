import 'dart:io';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';

class AddPetUsecase {
  final PetRepository repository;

  AddPetUsecase({required this.repository});

  Future<PetEntity> call(PetEntity newPet, File image) {
    return repository.addPet(newPet, image);
  }
}
