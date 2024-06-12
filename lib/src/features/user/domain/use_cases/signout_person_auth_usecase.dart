import 'package:petmeals/src/features/user/domain/repositories/person_auth_repository.dart';

class SignoutPersonAuthUsecase {
  final PersonAuthRepository repository;

  SignoutPersonAuthUsecase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
