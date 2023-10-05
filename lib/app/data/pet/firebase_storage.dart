import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadImage(File image, String userId) async {
  final format = DateFormat('ddMMyyyyHHmmss');
  final nameImg = format.format(DateTime.now());

  final ref = storage
      .ref()
      .child('images')
      .child(userId)
      .child('pets')
      .child('___${nameImg}___');

  final uploadTask = ref.putFile(image);
  final taskSnapshot = await uploadTask.whenComplete(() => true);

  final url = await taskSnapshot.ref.getDownloadURL();

  return url;
}

void deleteImage(String imageName, String userId) {
  final img = imageName.split('___')[1];

  storage
      .ref()
      .child('images')
      .child(userId)
      .child('pets')
      .child('___${img}___')
      .delete();
}
