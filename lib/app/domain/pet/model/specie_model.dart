import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'specie_model.freezed.dart';
part 'specie_model.g.dart';

@unfreezed
class Specie with _$Specie {
  factory Specie({
    String? name,
    String? id,
  }) = _Specie;

  factory Specie.fromJson(Map<String, Object?> json) => _$SpecieFromJson(json);
}
