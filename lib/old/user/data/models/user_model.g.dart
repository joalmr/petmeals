// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      email: json['email'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'photo': instance.photo,
      'email': instance.email,
      'lastname': instance.lastname,
    };
