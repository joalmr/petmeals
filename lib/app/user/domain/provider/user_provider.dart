import 'dart:developer';
import 'package:comfypet/app/user/data/services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserData userData;
  UserProvider({required this.userData});

  UserCredential? user;

  void signInGoogle(BuildContext context) async {
    user = await userData.signInGoogle();
    inspect(user);

    if (user!.user == null) {
      throw Exception();
    }

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed('/home');
    log("->go to HomeView");
    notifyListeners();
  }
}
