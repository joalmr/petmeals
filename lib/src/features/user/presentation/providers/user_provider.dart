import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/core/utils/constant/constant.dart' as global;
import 'package:petmeals/src/features/user/domain/use_cases/signin_person_auth_usecase.dart';
import 'package:petmeals/src/features/user/domain/use_cases/signout_person_auth_usecase.dart';

class UserProvider extends ChangeNotifier {
  // final UserUsecase userUsecase;
  final SigninPersonAuthUsecase signInUsecase;
  final SignoutPersonAuthUsecase signOutUsecase;

  UserProvider(this.signInUsecase, this.signOutUsecase);

  Future<User?> signInGoogle() async {
    final userResponse = await signInUsecase();

    if (userResponse!.user == null) {
      throw Exception();
    } else {
      final user = userResponse.user;

      //! esto se debe de ir
      MyStorage().uid = user!.uid;
      MyStorage().name = user.displayName.toString().split(' ')[0];
      MyStorage().photo = user.photoURL!;
      //! esto se va
      global.userId = user.uid;

      return user;
    }
  }

  Future<void> signOut() async {
    await signOutUsecase();
    MyStorage().box.erase();
  }
}
