import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class DeleteAttentionUsecase {
  final AttentionRepository repository;

  DeleteAttentionUsecase({required this.repository});

  Future<void> call(String id, String petId) {
    return repository.deleteAttention(id, petId);
  }
}
