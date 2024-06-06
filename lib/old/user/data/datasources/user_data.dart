import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:petmeals/old/user/data/models/user_model.dart';
import 'package:petmeals/old/user/domain/repositories/user_repository.dart';

class UserData implements UserRepository {
  final fireRef = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) {
          final user = UserModel.fromJson(snapshot.data()!);
          final newUser = user.copyWith(id: snapshot.id);
          return newUser;
        },
        toFirestore: (user, _) => user.toJson(),
      );

  MyStorage storage = MyStorage();

  @override
  Future<UserCredential?> signInGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Logger().e("Error signIn", error: e.toString());
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      storage.box.erase();
    } catch (e) {
      Logger().e("Error signOut", error: e);
    }
  }

  @override
  Future<void> deleteUserAuth() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      await GoogleSignIn().signOut();
      storage.box.erase();
    } catch (e) {
      Logger().e("Error deleteUserAuth", error: e);
    }
  }
}