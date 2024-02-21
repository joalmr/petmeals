// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attentions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttentionsModelImpl _$$AttentionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttentionsModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      product: json['product'] as String?,
      type: json['type'] as String?,
      nextDate: json['nextDate'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$AttentionsModelImplToJson(
        _$AttentionsModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'product': instance.product,
      'type': instance.type,
      'nextDate': instance.nextDate,
      'id': instance.id,
    };
