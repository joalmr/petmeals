import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

class AttentionModel extends AttentionEntity {
  const AttentionModel({
    super.id,
    super.date,
    super.nextDate,
    super.nextDateDuration,
    super.product,
    super.type,
  });

  factory AttentionModel.fromJson(json) {
    int? nextDateValue = (json['nextDate'] as num?)?.toInt();
    Duration duration = nextDateValue == null
        ? Duration.zero
        : Duration(days: 30 * nextDateValue);

    final DateTime nextDateDuration =
        DateTime.parse(json['date'] as String).add(duration);

    return AttentionModel(
      id: json['id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      nextDate: nextDateValue,
      nextDateDuration: nextDateDuration,
      product: json['product'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date?.toIso8601String(),
      'nextDate': nextDate,
      'product': product,
      'type': type,
    };
  }

  AttentionModel copyWith({
    String? id,
    DateTime? date,
    int? nextDate,
    DateTime? nextDateDuration,
    String? product,
    String? type,
  }) {
    return AttentionModel(
      id: id ?? this.id,
      date: date ?? this.date,
      nextDate: nextDate ?? this.nextDate,
      nextDateDuration: nextDateDuration ?? this.nextDateDuration,
      product: product ?? this.product,
      type: type ?? this.type,
    );
  }

  factory AttentionModel.fromEntity(AttentionEntity attention) {
    return AttentionModel(
      id: attention.id,
      date: attention.date,
      nextDate: attention.nextDate,
      nextDateDuration: attention.nextDateDuration,
      product: attention.product,
      type: attention.type,
    );
  }
}
