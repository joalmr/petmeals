import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:petmeals/src/user/data/datasources/user_data.dart';
import 'package:petmeals/src/user/domain/repositories/user_repository.dart';

class UserUsecase implements UserRepository {
  final UserData userData;

  UserUsecase({required this.userData});

  @override
  Future<dynamic> getUser(String uid) {
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInGoogle() async {
    final response = await userData.signInGoogle();

    if (response?.user != null) {
      MyStorage().uid = response!.user!.uid;
      MyStorage().name = response.user!.displayName.toString().split(' ')[0];
      MyStorage().photo = response.user!.photoURL!;
    }
    return response;
  }

  @override
  Future<void> signOut() async {
    return await userData.signOut();
  }

  @override
  Future<void> deleteUserAuth() async {
    await userData.deleteUserAuth();
  }
}
