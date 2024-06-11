import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

abstract class AttentionRepository {
  Future<List<Attention>> getAttentions(String petId);
  Future<List<Attention>> getNextAttentions(String petId);
  Future<Attention> addAttention(Attention attention, String petId);
  Future<void> deleteAttention(String id, String petId);
}
