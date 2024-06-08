import 'package:firebase_auth/firebase_auth.dart';

abstract class PersonAuthRepository {
  Future<UserCredential?> signInGoogle();
  Future<void> signOut();
}
