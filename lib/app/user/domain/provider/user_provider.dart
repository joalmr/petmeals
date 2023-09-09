import 'package:comfypet/app/user/data/local/users_local.dart';
import 'package:comfypet/app/user/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UsersLocal userData;
  UserProvider({required this.userData});

  UserModel? user;

  void signInGoogle() async {
    user = await userData.signInGoogle();
    notifyListeners();
  }
}
