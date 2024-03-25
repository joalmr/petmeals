import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petmeals/src/constant/global.dart';
import 'package:petmeals/my_app.dart';
import 'package:petmeals/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petmeals/setup.get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await dotenv.load(fileName: ".env.dev");
  setupProvidersGetIt();
  Global.app = "Development";
  runApp(const MyApp());
}
