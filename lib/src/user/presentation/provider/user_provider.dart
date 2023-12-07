import 'package:petmeals/src/user/data/datasources/user_data.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserData userData;
  UserProvider({required this.userData}) {
    if (MyStorage().uid.isNotEmpty) {
      uid = MyStorage().uid;
    }
    if (MyStorage().name.isNotEmpty) {
      name = MyStorage().name;
    }
    if (MyStorage().photo.isNotEmpty) {
      photoUrl = MyStorage().photo;
    }
  }

  String? uid;
  String? name;
  String? photoUrl;

  Future<User?> signInGoogle() async {
    final userResponse = await userData.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    } else {
      final user = userResponse.user;

      uid = user?.uid;
      name = user?.displayName.toString().split(' ')[0];
      photoUrl = user?.photoURL;
      notifyListeners(); //! quizá no es útil
      return user;
    }
  }

  Future<void> signOut() async {
    await userData.signOut();
    MyStorage().box.erase();
  }
}
