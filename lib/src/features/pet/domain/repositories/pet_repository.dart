import 'dart:io';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';

abstract class PetRepository {
  Future<PetEntity> addPet(PetEntity newPet, File image);
  Future<void> deletePet(String petId);
  Stream<List<PetEntity>> loadPets(String userId);
  Future<List<PetEntity>> getPets(String userId);
  Future<PetEntity> updatePet(PetEntity pet, String userId, File? img);
}
