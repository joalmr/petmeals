import 'dart:io';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetUseCase implements PetRepository {
  final PetsData petData;

  PetUseCase({required this.petData});

  @override
  Future<bool> addPet(PetModel newPet, File image, String userId) async {
    return await petData.addPet(newPet, image, userId);
  }

  @override
  Future<void> deletePet(String id, String userId) async {
    await petData.deletePet(id, userId);
  }

  @override
  Stream<List<PetModel>> loadPets(String userId) {
    return petData.loadPets(userId);
  }

  @override
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img) async {
    return await petData.updatePet(pet, userId, img);
  }

  Future<PetModel?> actionPet(PetModel pet, String userId) async {
    return await petData.updatePet(pet, userId, null);
  }

  Future<PetModel?> foodPet(PetModel pet, String userId) async {
    return await petData.updatePet(pet, userId, null);
  }

  @override
  Future<List<PetModel>> getPets(String userId) {
    return petData.getPets(userId);
  }

  @override
  Future<List<AttentionsModel>> getAttentions(String petId, String type) {
    return petData.getAttentions(petId, type);
  }

  @override
  Future<bool> addAttention(AttentionsModel attention, String petId) {
    return petData.addAttention(attention, petId);
  }

  @override
  Future<void> deleteAttention(String id, String petId) {
    return petData.deleteAttention(id, petId);
  }
}
