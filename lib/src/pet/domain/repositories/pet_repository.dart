import 'dart:io';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';

abstract interface class PetRepository {
  Future<bool> addPet(PetModel newPet, File image, String userId);
  Future<void> deletePet(String id, String userId);
  Stream<List<PetModel>> loadPets(String userId);
  Future<List<PetModel>> getPets(String userId);
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img);
  Future<List<AttentionsModel>> getAttentions(String userId, String type);
  Future<bool> addAttention(AttentionsModel attention, String petId);
  Future<void> deleteAttention(String id, String petId);
}
