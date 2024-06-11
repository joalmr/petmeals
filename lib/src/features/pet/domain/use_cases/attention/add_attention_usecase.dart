import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class AddAttentionUseCase {
  final AttentionRepository repository;

  AddAttentionUseCase({required this.repository});

  Future<Attention> call(Attention attention, String petId) {
    return repository.addAttention(attention, petId);
  }
}
