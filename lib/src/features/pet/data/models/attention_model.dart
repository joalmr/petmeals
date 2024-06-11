import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

class AttentionModel extends Attention {
  const AttentionModel({
    super.id,
    super.date,
    super.nextDate,
    super.product,
    super.type,
  });

  factory AttentionModel.fromJson(json) {
    return AttentionModel(
      id: json['id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      nextDate: (json['nextDate'] as num?)?.toInt(),
      product: json['product'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'nextDate': nextDate,
      'product': product,
      'type': type,
    };
  }

  AttentionModel copyWith({
    String? id,
    DateTime? date,
    int? nextDate,
    String? product,
    String? type,
  }) {
    return AttentionModel(
      id: id ?? this.id,
      date: date ?? this.date,
      nextDate: nextDate ?? this.nextDate,
      product: product ?? this.product,
      type: type ?? this.type,
    );
  }

  factory AttentionModel.fromEntity(Attention attention) {
    return AttentionModel(
      id: attention.id,
      date: attention.date,
      nextDate: attention.nextDate,
      product: attention.product,
      type: attention.type,
    );
  }
}
