import 'dart:convert';
import 'package:petmeals/app/data/pet/models/specie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

List<PetModel> petModelFromJson(String str) =>
    List<PetModel>.from(json.decode(str).map((x) => PetModel.fromJson(x)));

@freezed
class PetModel with _$PetModel {
  factory PetModel({
    String? name,
    Specie? specie,
    DateTime? borndate,
    String? id,
    String? photo,
    bool? sex,
    bool? sterillized,
    List<String>? userId,
    int? age,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, Object?> json) =>
      _$PetModelFromJson(json);
}
