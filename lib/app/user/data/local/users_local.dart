import 'package:comfypet/app/user/domain/model/user_model.dart';
import 'package:flutter/services.dart';

class UsersLocal {
  Future<UserModel> signInGoogle() async {
    final json = await rootBundle.loadString("json/users.json");
    final user = userModelFromJson(json).first;
    return user;
  }
}
