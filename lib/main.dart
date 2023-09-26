import 'package:comfypet/app/pet/ui/home/views/home.dart';
import 'package:comfypet/app/pet/ui/pet/views/pet_add.dart';
import 'package:comfypet/app/pet/ui/pet/views/pet_detail.dart';
import 'package:comfypet/app/user/ui/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:comfypet/firebase_options.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:comfypet/providers.main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  setupProviders();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comfypet',
      theme: themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es', 'ES')],
      initialRoute: MyStorage().uid.isNotEmpty ? 'home' : '/',
      routes: {
        '/': (context) => const LoginView(),
        'home': (context) => const HomeView(),
        'add': (context) => PetAddView(),
        'petdetail': (context) => const PetDetailView(),
      },
    );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => userProvider),
    //     ChangeNotifierProvider(create: (context) => petProvider, lazy: true),
    //   ],
    //   child: ···
    // );
  }
}
