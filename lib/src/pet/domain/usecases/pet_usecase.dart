import 'dart:io';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetUseCase implements PetRepository {
  final PetsData petData;

  PetUseCase({required this.petData});

  @override
  Future<PetModel> addPet(PetModel newPet, File image) =>
      petData.addPet(newPet, image);

  @override
  Future<void> deletePet(String petId) => petData.deletePet(petId);

  @override
  Stream<List<PetModel>> loadPets(String userId) => petData.loadPets(userId);

  @override
  Future<PetModel> updatePet(PetModel pet, String userId, File? img) =>
      petData.updatePet(pet, userId, img);

  Future<PetModel?> actionPet(PetModel pet, String userId) =>
      petData.updatePet(pet, userId, null);

  Future<PetModel?> foodPet(PetModel pet, String userId) =>
      petData.updatePet(pet, userId, null);

  @override
  Future<List<PetModel>> getPets(String userId) => petData.getPets(userId);

  @override
  Future<List<AttentionsModel>> getAttentions(String petId, String type) =>
      petData.getAttentions(petId, type);

  @override
  Future<AttentionsModel> addAttention(
          AttentionsModel attention, String petId) =>
      petData.addAttention(attention, petId);

  @override
  Future<void> deleteAttention(String id, String petId) =>
      petData.deleteAttention(id, petId);
}
