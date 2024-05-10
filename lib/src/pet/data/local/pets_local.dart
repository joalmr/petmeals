import 'package:flutter/services.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';

class PetsLocal {
  Future<List<PetModel>> getPets() async {
    final json = await rootBundle.loadString('json/pets.json');
    final pets = petModelFromJson(json);
    return pets;
  }
}
