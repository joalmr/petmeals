import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadImage(File image, String userId) async {
  try {
    final format = DateFormat('ddMMyyyyHHmmss');
    final nameImg = format.format(DateTime.now());

    Reference ref = storage
        .ref()
        .child('images')
        .child(userId)
        .child('pets')
        .child('___${nameImg}___');

    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => true);
    inspect(taskSnapshot);
    final String url = await taskSnapshot.ref.getDownloadURL();
    log(url);
    return url;
  } catch (e) {
    Logger().e(e);
    return '';
  }
}

void deleteImage(String imageName, String userId) async {
  try {
    String img = imageName.split('___')[1];

    final desertRef = storage
        .ref()
        .child('images')
        .child(userId)
        .child('pets')
        .child('___${img}___');

    desertRef.delete();
  } catch (e) {
    Logger().e(e);
  }
}
