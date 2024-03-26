import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadImage(File image, String petId) async {
  try {
    Reference ref =
        storage.ref().child('images').child('pets').child(petId).child('image');

    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => true);
    inspect(taskSnapshot);
    final String url = await taskSnapshot.ref.getDownloadURL();
    log(url);
    return url;
  } catch (e) {
    Logger().e('uploadImage', error: e);
    return '';
  }
}

void deleteImage(String petId) async {
  try {
    final desertRef =
        storage.ref().child('images').child('pets').child(petId).child('image');

    desertRef.delete();
  } catch (e) {
    Logger().e('deleteImage', error: e);
  }
}
