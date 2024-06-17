import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/core/error/failure.dart';

import 'package:path/path.dart' as p;

final FirebaseStorage storage = FirebaseStorage.instance;

Future<File> testCompressAndGetFile(File file, String targetPath) async {
  var basename = p.basenameWithoutExtension(file.path);
  var pathString = file.path.split(basename)[0];

  var pathStringWithExtension = "$pathString$basename.jpeg";

  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    pathStringWithExtension,
    format: CompressFormat.jpeg,
    quality: 80,
    minHeight: 500,
    minWidth: 500,
  );

  File fileCompress = File(result!.path);

  Logger().i('Sin compresion: ${file.lengthSync()}');
  Logger().i('Con compresion: ${fileCompress.lengthSync()}');

  return fileCompress;
}

Future<String> uploadImage(File? image, String petId) async {
  try {
    if (image == null) return '';

    final imageCompress = await testCompressAndGetFile(image, image.path);

    Reference ref = storage
        .ref()
        .child('images')
        .child('pets')
        .child(petId)
        .child('image${p.extension(imageCompress.path)}');

    final UploadTask uploadTask = ref.putFile(imageCompress);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => true);

    final String url = await taskSnapshot.ref.getDownloadURL();

    return url;
  } on FirebaseException catch (e) {
    throw ServerFailure(message: e.stackTrace.toString());
  }
}

void deleteImage(String petId) async {
  try {
    final desertRef = storage
        .ref()
        .child('images')
        .child('pets')
        .child(petId)
        .child('image.jpeg');

    desertRef.delete();
  } on FirebaseException catch (e) {
    throw ServerFailure(message: e.stackTrace.toString());
  }
}
