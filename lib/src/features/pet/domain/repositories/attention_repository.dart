import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

abstract class AttentionRepository {
  Future<List<AttentionEntity>> getAttentions(String petId);
  Future<List<AttentionEntity>> getNextAttentions(String petId);
  Future<AttentionEntity> addAttention(AttentionEntity attention, String petId);
  Future<void> deleteAttention(String id, String petId);
}
