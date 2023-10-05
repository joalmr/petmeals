import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfypet/app/domain/user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserData {
  //*sign in
  Future<UserCredential?> signInGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  //*sign out
  Future<void> signOut() async => FirebaseAuth.instance.signOut();

  //*Firebase
  final fireRef = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) {
          final user = UserModel.fromJson(snapshot.data()!);
          final newUser = user.copyWith(id: snapshot.id);
          return newUser;
        },
        toFirestore: (user, _) => user.toJson(),
      );

  //*get users
  Future<DocumentSnapshot<UserModel>> getUser(String uid) {
    return fireRef.doc(uid).get();
  }
}
