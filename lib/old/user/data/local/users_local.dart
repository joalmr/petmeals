import 'package:flutter/services.dart';
import 'package:petmeals/old/user/data/models/user_model.dart';

class UsersLocal {
  Future<UserModel> signInGoogle() async {
    final json = await rootBundle.loadString('json/users.json');
    final user = userModelFromJson(json).first;
    return user;
  }
}
