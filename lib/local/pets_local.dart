import 'package:petmeals/app/data/pet/models/pet_model.dart';
import 'package:flutter/services.dart';

class PetsLocal {
  Future<List<PetModel>> getPets() async {
    final json = await rootBundle.loadString('json/pets.json');
    final pets = petModelFromJson(json);
    return pets;
  }
}
