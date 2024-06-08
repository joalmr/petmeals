import 'package:firebase_auth/firebase_auth.dart';
import 'package:petmeals/src/features/user/data/datasources/person_auth_remote.dart';
import 'package:petmeals/src/features/user/domain/repositories/person_auth_repository.dart';

class PersonAuthRepositoryImpl implements PersonAuthRepository {
  final PersonAuthRemoteDataSource remoteDataSource;
  PersonAuthRepositoryImpl({required this.remoteDataSource});

  //?? aca debo usar dartz
  @override
  Future<UserCredential?> signInGoogle() {
    return remoteDataSource.signInGoogle();
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
}
