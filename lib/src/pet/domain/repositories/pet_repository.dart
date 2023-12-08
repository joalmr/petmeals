import 'dart:io';

import 'package:petmeals/src/pet/data/models/pet_model.dart';

abstract class PetRepository {
  Future<PetModel?> actionPet(PetModel pet, String userId);
  Future<bool> addPet(PetModel newPet, File image, String userId);
  Future<void> deletePet(String id, String userId);
  Future<PetModel?> foodPet(PetModel pet, String userId);
  Stream<List<PetModel>> loadStream(String userId);
  Future<PetModel?> updatePet(PetModel pet, String userId, File? img);
}
