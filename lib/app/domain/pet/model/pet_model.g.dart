// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      name: json['name'] as String?,
      specie: json['specie'] == null
          ? null
          : Specie.fromJson(json['specie'] as Map<String, dynamic>),
      borndate: json['borndate'] == null
          ? null
          : DateTime.parse(json['borndate'] as String),
      id: json['id'] as String?,
      photo: json['photo'] as String?,
      sex: json['sex'] as bool?,
      sterillized: json['sterillized'] as bool?,
      userId:
          (json['userId'] as List<dynamic>?)?.map((e) => e as String).toList(),
      // age: json['age'] as int?,
      age: (DateTime.now()
              .difference(DateTime.parse(json["borndate"]))
              .inDays) ~/
          365, //? [solo fromJson PetModel]
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'specie': instance.specie!.toJson(),
      'borndate': instance.borndate?.toIso8601String(),
      // 'id': instance.id,
      'photo': instance.photo,
      'sex': instance.sex,
      'sterillized': instance.sterillized,
      'userId': instance.userId,
      // 'age': instance.age,
      "created_at": DateTime.timestamp(), //? [solo toJson PetModel]
    };
