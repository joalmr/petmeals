import 'package:comfypet/app/user/data/local/users_list.dart';
import 'package:comfypet/app/user/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider();

  UserModel? user;

  void signInGoogle() async {
    user = usersTest.first;
    notifyListeners();
  }
}
