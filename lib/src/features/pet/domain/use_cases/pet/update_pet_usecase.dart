import 'dart:io';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';

class UpdatePetUsecase {
  final PetRepository repository;

  UpdatePetUsecase({required this.repository});

  Future<PetEntity> call(PetEntity pet, String userId, File? img) {
    return repository.updatePet(pet, userId, img);
  }
}
