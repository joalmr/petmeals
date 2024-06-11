import 'package:equatable/equatable.dart';

class AttentionEntity extends Equatable {
  final String? id;
  final DateTime? date;
  final int? nextDate;
  final String? product;
  final String? type;

  const AttentionEntity({
    this.id,
    this.date,
    this.nextDate,
    this.product,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        nextDate,
        product,
        type,
      ];
}
