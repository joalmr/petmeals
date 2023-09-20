import 'package:comfypet/app/pet/data/services/pets_data.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/views/home.dart';
import 'package:comfypet/app/pet/ui/pet/views/pet_add.dart';
import 'package:comfypet/app/pet/ui/pet/views/pet_detail.dart';
import 'package:comfypet/app/user/data/services/user_data.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:comfypet/app/user/ui/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:comfypet/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = UserProvider(userData: UserData());
    final petProvider = PetProvider(
      petData: PetsData(),
      userProvider: userProvider,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userProvider),
        ChangeNotifierProvider(create: (context) => petProvider, lazy: true),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comfypet',
        theme: themeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'ES'),
        ],
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/add': (context) => const PetAddView(),
          '/petdetail': (context) => const PetDetailView(),
        },
      ),
    );
  }
}
