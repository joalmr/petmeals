import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserRepository {
  Future<UserCredential?> signInGoogle();
  Future<void> signOut();
  Future<void> deleteUserAuth();
}
