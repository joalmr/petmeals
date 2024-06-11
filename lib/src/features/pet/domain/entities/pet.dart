import 'package:equatable/equatable.dart';
import 'package:petmeals/src/features/pet/data/models/pet_model.dart';

class PetEntity extends Equatable {
  final String? id;
  final List<String>? actions;
  final int? age;
  final DateTime? borndate;
  final List<String>? foods;
  final String? name;
  final String? photo;
  final bool? sex;
  final int? specie;
  final bool? sterillized;
  final List<String>? userId;

  const PetEntity({
    this.id,
    this.actions,
    this.age,
    this.borndate,
    this.foods,
    this.name,
    this.photo,
    this.sex,
    this.specie,
    this.sterillized,
    this.userId,
  });

  @override
  List<Object?> get props => [
        id,
        actions,
        age,
        borndate,
        foods,
        name,
        photo,
        sex,
        specie,
        sterillized,
        userId,
      ];

  factory PetEntity.toEntity(PetModel model) {
    return PetEntity(
      id: model.id,
      actions: model.actions,
      age: model.age,
      borndate: model.borndate,
      foods: model.foods,
      name: model.name,
      photo: model.photo,
      sex: model.sex,
      specie: model.specie,
      sterillized: model.sterillized,
      userId: model.userId,
    );
  }
}
