import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:petmeals/src/core/error/failure.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadImage(File image, String petId) async {
  try {
    Reference ref =
        storage.ref().child('images').child('pets').child(petId).child('image');

    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => true);

    final String url = await taskSnapshot.ref.getDownloadURL();

    return url;
  } on FirebaseException catch (e) {
    throw ServerFailure(message: e.stackTrace.toString());
  }
}

void deleteImage(String petId) async {
  try {
    final desertRef =
        storage.ref().child('images').child('pets').child(petId).child('image');

    desertRef.delete();
  } on FirebaseException catch (e) {
    throw ServerFailure(message: e.stackTrace.toString());
  }
}
