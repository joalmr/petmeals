import 'dart:io';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/domain/repositories/pet_repository.dart';

class PetUseCase implements PetRepository {
  final PetsData petData;

  PetUseCase({required this.petData});

  @override
  Future<PetModel?> actionPet(PetModel updatePet, String userId) async {
    return await petData.updatePet(updatePet, null, userId);
  }

  @override
  Future<bool> addPet(PetModel addPet, File image, String userId) async {
    return await petData.addPet(addPet, image, userId);
  }

  @override
  Future<void> deletePet(String id) {
    // TODO: implement deletePet
    throw UnimplementedError();
  }

  @override
  Future<PetModel?> foodPet(PetModel updatePet) {
    // TODO: implement foodPet
    throw UnimplementedError();
  }

  @override
  Stream<List<PetModel>> loadStream() {
    // TODO: implement loadStream
    throw UnimplementedError();
  }

  @override
  Future<PetModel?> updatePet(PetModel updatePet) {
    // TODO: implement updatePet
    throw UnimplementedError();
  }
}
