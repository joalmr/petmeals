import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';

class PetModel extends PetEntity {
  const PetModel({
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
      actions:
          (json['actions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      age: (DateTime.now()
              .difference((json['borndate'] as Timestamp).toDate())
              .inDays) ~/
          365,
      borndate: json['borndate'] == null
          ? null
          : (json['borndate'] as Timestamp).toDate(),
      foods:
          (json['foods'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'],
      photo: json['photo'],
      sex: json['sex'],
      specie: (json['specie'] as num?)?.toInt(),
      sterillized: json['sterillized'],
      userId:
          (json['userId'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'actions': actions,
      'borndate': Timestamp.fromDate(borndate!),
      // 'created_at': DateTime.timestamp(),
      'foods': foods,
      'name': name,
      'photo': photo,
      'sex': sex,
      'specie': specie,
      'sterillized': sterillized,
      'userId': userId,
    };
  }

  PetModel copyWith({
    String? id,
    List<String>? actions,
    int? age,
    DateTime? borndate,
    List<String>? foods,
    String? name,
    String? photo,
    bool? sex,
    int? specie,
    bool? sterillized,
    List<String>? userId,
  }) {
    return PetModel(
      id: id ?? this.id,
      actions: actions ?? this.actions,
      age: age ?? this.age,
      borndate: borndate ?? this.borndate,
      foods: foods ?? this.foods,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      sex: sex ?? this.sex,
      specie: specie ?? this.specie,
      sterillized: sterillized ?? this.sterillized,
      userId: userId ?? this.userId,
    );
  }

  factory PetModel.fromEntity(PetEntity entity) {
    return PetModel(
      id: entity.id,
      actions: entity.actions,
      age: entity.age,
      borndate: entity.borndate,
      foods: entity.foods,
      name: entity.name,
      photo: entity.photo,
      sex: entity.sex,
      specie: entity.specie,
      sterillized: entity.sterillized,
      userId: entity.userId,
    );
  }
}
