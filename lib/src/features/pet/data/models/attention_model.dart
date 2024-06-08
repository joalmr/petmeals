import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

class AttentionModel extends Attention {
  AttentionModel({
    super.id,
    super.date,
    super.nextDate,
    super.product,
    super.type,
  });

  factory AttentionModel.fromJson(Map<String, dynamic> json) {
    return AttentionModel(
      id: json['id'],
      date: json['date'],
      nextDate: json['nextDate'],
      product: json['product'],
      type: json['type'],
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
}
