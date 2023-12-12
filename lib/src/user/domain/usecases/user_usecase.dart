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
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInGoogle() async {
    userData.signInGoogle().then((value) {
      if (value!.user != null) {
        MyStorage().uid = value.user!.uid;
        MyStorage().name = value.user!.displayName.toString().split(' ')[0];
        MyStorage().photo = value.user!.photoURL!;
      }
      return value;
    });
    return null;
  }

  @override
  Future<void> signOut() async {
    return await userData.signOut();
  }
}
