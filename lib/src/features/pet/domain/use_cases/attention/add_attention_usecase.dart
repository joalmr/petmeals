import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class AddAttentionUseCase {
  final AttentionRepository repository;

  AddAttentionUseCase({required this.repository});

  Future<AttentionEntity> call(AttentionEntity attention, String petId) {
    return repository.addAttention(attention, petId);
  }
}
