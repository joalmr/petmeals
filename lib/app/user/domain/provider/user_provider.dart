import 'dart:developer';
import 'package:comfypet/app/user/data/services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserData userData;
  UserProvider({required this.userData});

  User? user;
  String? name;
  String? photoUrl;
  String? uid;

  void signInGoogle(BuildContext context) async {
    final userResponse = await userData.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    }

    user = userResponse.user;

    uid = user?.uid;
    name = user?.displayName.toString().split(' ')[0];
    photoUrl = user?.photoURL;

    getUser();
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home');
    log("->go to HomeView");

    notifyListeners();
  }

  void getUser() async {
    await userData.getUser(uid!);
    notifyListeners();
  }
}
