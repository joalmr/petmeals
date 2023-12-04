import 'package:petmeals/global.dart';
import 'package:petmeals/main.get_it.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:petmeals/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  setupProvidersGetIt();

  Global.app = "Development";
  runApp(const MainAppGetIt());
}
