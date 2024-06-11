import 'package:equatable/equatable.dart';

class Attention extends Equatable {
  final String? id;
  final DateTime? date;
  final int? nextDate;
  final String? product;
  final String? type;

  const Attention({
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
