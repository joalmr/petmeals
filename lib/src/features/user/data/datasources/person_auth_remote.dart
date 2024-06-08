import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petmeals/src/features/user/data/models/person_auth_model.dart';
import 'package:petmeals/src/core/error/failure.dart';

abstract class PersonAuthRemoteDataSource {
  Future<UserCredential?> signInGoogle();
  Future<void> signOut();
}

class PersonAuthRemoteDataSourceImpl implements PersonAuthRemoteDataSource {
  final fireRef = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) {
          final user = PersonAuthModel.fromJson(snapshot.data()!);
          final newUser = user.copyWith(id: snapshot.id);
          return newUser;
        },
        toFirestore: (user, _) => {},
      );

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
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(message: e.stackTrace.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(message: e.stackTrace.toString());
    }
  }
}
