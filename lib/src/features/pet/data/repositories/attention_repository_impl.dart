import 'package:petmeals/src/features/pet/data/datasources/attention_remote.dart';
import 'package:petmeals/src/features/pet/domain/entities/attention.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';

class AttentionRepositoryImpl implements AttentionRepository {
  final AttentionRemoteDataSource remoteDataSource;

  AttentionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Attention> addAttention(Attention attention, String petId) async {
    Attention response = await remoteDataSource.addAttention(attention, petId);
    return response;
  }

  @override
  Future<void> deleteAttention(String id, String petId) async {
    return await remoteDataSource.deleteAttention(id, petId);
  }

  @override
  Future<List<Attention>> getAttentions(String petId) async {
    List<Attention> response = await remoteDataSource.getAttentions(petId);
    return response;
  }

  @override
  Future<List<Attention>> getNextAttentions(String petId) async {
    List<Attention> response = await remoteDataSource.getNextAttentions(petId);
    return response;
  }
}
