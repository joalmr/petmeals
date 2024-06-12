import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class GetNextAttentionsUsecase {
  final AttentionRepository repository;

  GetNextAttentionsUsecase({required this.repository});

  Future<List<AttentionEntity>> call(String petId) {
    return repository.getNextAttentions(petId);
  }
}
