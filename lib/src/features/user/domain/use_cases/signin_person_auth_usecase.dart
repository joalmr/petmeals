import 'package:firebase_auth/firebase_auth.dart';
import 'package:petmeals/src/features/user/domain/repositories/person_auth_repository.dart';

class SigninPersonAuthUsecase {
  final PersonAuthRepository repository;

  SigninPersonAuthUsecase({required this.repository});

  Future<UserCredential?> call() async {
    return repository.signInGoogle();
  }
}
