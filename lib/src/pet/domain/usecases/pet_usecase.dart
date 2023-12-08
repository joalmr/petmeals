import 'dart:io';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetUseCase implements PetRepository {
  final PetsData petData;

  PetUseCase({required this.petData});

  @override
  Future<PetModel?> actionPet(PetModel pet, String userId) async {
    return await petData.updatePet(pet, null, userId);
  }

  @override
  Future<bool> addPet(PetModel newPet, File image, String userId) async {
    return await petData.addPet(newPet, image, userId);
  }

  @override
  Future<void> deletePet(String id, String userId) async {
    await petData.deletePet(id, userId);
  }

  @override
  Future<PetModel?> foodPet(PetModel pet, String userId) async {
    return await petData.updatePet(pet, null, userId);
  }

  @override
  Stream<List<PetModel>> loadStream(String userId) {
    return petData.getPetStream(userId);
  }

  @override
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img) async {
    return await petData.updatePet(pet, img, userId);
  }
}
