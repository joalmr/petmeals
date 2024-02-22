import 'package:petmeals/config/storage/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/user/domain/usecases/user_usecase.dart';

class UserProvider extends ChangeNotifier {
  final UserUsecase userUsecase;

  UserProvider({required this.userUsecase});

  Future<User?> signInGoogle() async {
    final userResponse = await userUsecase.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    } else {
      final user = userResponse.user;

      MyStorage().uid = user!.uid;
      MyStorage().name = user.displayName.toString().split(' ')[0];
      MyStorage().photo = user.photoURL!;

      return user;
    }
  }

  Future<void> signOut() async {
    await userUsecase.signOut();
    MyStorage().box.erase();
  }

  Future<void> deleteUserAuth() async {
    await userUsecase.deleteUserAuth();
  }
}
