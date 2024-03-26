import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petmeals/src/user/data/datasources/user_data.dart';
import 'package:petmeals/src/user/domain/repositories/user_repository.dart';

class UserUsecase implements UserRepository {
  final UserData userData;

  UserUsecase({required this.userData});

  @override
  Future<UserCredential?> signInGoogle() => userData.signInGoogle();

  @override
  Future<void> signOut() => userData.signOut();

  @override
  Future<void> deleteUserAuth() => userData.deleteUserAuth();
}
