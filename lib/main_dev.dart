import 'package:petmeals/global.dart';
import 'package:petmeals/my_app.dart';
import 'package:petmeals/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petmeals/setup.get_it.dart';
<<<<<<< Updated upstream
=======
// import 'package:supabase_flutter/supabase_flutter.dart';
>>>>>>> Stashed changes

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
<<<<<<< Updated upstream
=======
  // await Supabase.initialize(
  //   url: 'https://pmjocatmoyanuathmgfd.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBtam9jYXRtb3lhbnVhdGhtZ2ZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg4NDc5NjEsImV4cCI6MTk4NDQyMzk2MX0.RbFq239ETHemb3C_3S83IVSHdX5dalKXXcjUFLhrY0M',
  // );
>>>>>>> Stashed changes
  await GetStorage.init();
  setupProvidersGetIt();
  Global.app = "Development";
  runApp(const MyApp());
}
