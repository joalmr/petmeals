import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<UserCredential?> signInGoogle();
  Future<void> signOut();
  Future<void> deleteUserAuth();
  Future<dynamic> getUser(String uid);
}
