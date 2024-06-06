import 'dart:io';
import 'package:petmeals/old/pet/data/models/attentions_model.dart';
import 'package:petmeals/old/pet/data/models/pet_model.dart';

abstract interface class PetRepository {
  Future<PetModel> addPet(PetModel newPet, File image);
  Future<void> deletePet(String petId);
  Stream<List<PetModel>> loadPets(String userId);
  Future<List<PetModel>> getPets(String userId);
  Future<PetModel> updatePet(PetModel pet, String userId, File? img);
  Future<List<AttentionsModel>> getAttentions(String petId);
  Future<List<AttentionsModel>> getNextAttentions(String petId);
  Future<AttentionsModel> addAttention(AttentionsModel attention, String petId);
  Future<void> deleteAttention(String id, String petId);
}