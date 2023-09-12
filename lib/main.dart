import 'package:comfypet/app/pet/data/local/pets_local.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/views/home.dart';
import 'package:comfypet/app/user/data/services/user_data.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:comfypet/app/user/ui/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider(userData: UserData())),
        ChangeNotifierProvider(
            create: (context) => PetProvider(petData: PetsLocal())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comfypet',
        theme: themeData,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
        },
      ),
    );
  }
}
