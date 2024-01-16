import 'dart:io';
import 'package:petmeals/src/pet/data/models/pet_model.dart';

abstract class PetRepository {
  Future<bool> addPet(PetModel newPet, File image, String userId);
  Future<void> deletePet(String id, String userId);
  Stream<List<PetModel>> loadPets(String userId);
  Future<List<PetModel>> getPets(String userId);
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img);
  // Future<PetModel?> actionPet(PetModel pet, String userId);
  // Future<PetModel?> foodPet(PetModel pet, String userId);
}
