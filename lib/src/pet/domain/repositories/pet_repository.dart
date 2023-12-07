import 'dart:io';

import 'package:petmeals/src/pet/data/models/pet_model.dart';

abstract class PetRepository {
  Future<PetModel?> actionPet(PetModel updatePet, String userId);
  Future<bool> addPet(PetModel newPet, File image, String userId);
  Future<void> deletePet(String id);
  Future<PetModel?> foodPet(PetModel updatePet);
  Stream<List<PetModel>> loadStream();
  Future<PetModel?> updatePet(PetModel updatePet);
}
