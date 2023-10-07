import 'package:comfypet/app/views/get_it/main.get_it.dart';
import 'package:comfypet/app/views/get_it/setup.get_it.dart';
import 'package:comfypet/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  setupProvidersGetIt();

  runApp(const MainAppGetIt());
}
