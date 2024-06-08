import 'package:petmeals/src/features/pet/domain/entities/pet.dart';

class PetModel extends Pet {
  PetModel({
    super.id,
    super.actions,
    super.age,
    super.borndate,
    super.foods,
    super.name,
    super.photo,
    super.sex,
    super.specie,
    super.sterillized,
    super.userId,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      actions: json['actions'],
      age: (DateTime.now()
              .difference(DateTime.parse(json['borndate']))
              .inDays) ~/
          365,
      borndate: json['borndate'],
      foods: json['foods'],
      name: json['name'],
      photo: json['photo'],
      sex: json['sex'],
      specie: json['specie'],
      sterillized: json['sterillized'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'actions': actions,
      'borndate': borndate,
      'foods': foods,
      'name': name,
      'photo': photo,
      'sex': sex,
      'specie': specie,
      'sterillized': sterillized,
      'userId': userId,
    };
  }
}
