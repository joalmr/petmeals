import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserData userData;
  UserProvider({required this.userData});

  User? _user;
  String? uid = MyStorage().uid;
  String? name = MyStorage().name;
  String? photoUrl = MyStorage().photo;

  Future<bool> signInGoogle() async {
    final userResponse = await userData.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    }

    _user = userResponse.user;

    uid = _user?.uid;
    name = _user?.displayName.toString().split(' ')[0];
    photoUrl = _user?.photoURL;

    MyStorage().uid = uid!;
    MyStorage().name = name!;
    MyStorage().photo = photoUrl!;

    if (_user != null) {
      return true;
    }
    return false;
  }

  void getUser() async {
    await userData.getUser(uid!);
    notifyListeners();
  }
}
