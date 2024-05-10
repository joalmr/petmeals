// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      actions:
          (json['actions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      age: (DateTime.now()
              .difference(DateTime.parse(json["borndate"]))
              .inDays) ~/
          365,
      borndate: json['borndate'] == null
          ? null
          : DateTime.parse(json['borndate'] as String),
      foods:
          (json['foods'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      sex: json['sex'] as bool?,
      specie: json['specie'] as int?,
      sterillized: json['sterillized'] as bool?,
      userId:
          (json['userId'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      'borndate': instance.borndate?.toIso8601String(),
      "created_at": DateTime.timestamp(),
      'foods': instance.foods,
      'name': instance.name,
      'photo': instance.photo,
      'sex': instance.sex,
      'specie': instance.specie,
      'sterillized': instance.sterillized,
      'userId': instance.userId,
    };
