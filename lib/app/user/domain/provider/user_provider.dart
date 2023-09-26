import 'package:comfypet/app/user/data/services/user_data.dart';
import 'package:comfypet/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserData userData;
  UserProvider({required this.userData});

  User? user;
  String? uid = MyStorage().uid;
  String? name = MyStorage().name;
  String? photoUrl = MyStorage().photo;

  Future<bool> signInGoogle(BuildContext context) async {
    final userResponse = await userData.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    }

    user = userResponse.user;

    uid = user?.uid;
    name = user?.displayName.toString().split(' ')[0];
    photoUrl = user?.photoURL;

    MyStorage().uid = uid!;
    MyStorage().name = name!;
    MyStorage().photo = photoUrl!;

    if (user != null) {
      return true;
    }
    return false;
    // getUser();
    // notifyListeners();
  }

  void getUser() async {
    await userData.getUser(uid!);
    notifyListeners();
  }
}
