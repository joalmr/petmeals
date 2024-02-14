import 'package:freezed_annotation/freezed_annotation.dart';

part 'attentions_model.freezed.dart';
part 'attentions_model.g.dart';

@freezed
class AttentionsModel with _$AttentionsModel {
  factory AttentionsModel({
    String? date,
    String? product,
    String? type,
    int? nextDate,
  }) = _AttentionsModel;

  factory AttentionsModel.fromJson(Map<String, Object?> json) =>
      _$AttentionsModelFromJson(json);
}
