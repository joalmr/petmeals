import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class GetAttentionsUsecase {
  final AttentionRepository repository;

  GetAttentionsUsecase({required this.repository});

  Future<List<Attention>> call(String petId) {
    return repository.getAttentions(petId);
  }
}
