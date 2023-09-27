import 'dart:developer';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/domain/pet/provider/pet_provider.dart';
import 'package:comfypet/app/domain/user/provider/user_provider.dart';
import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/app/views/provider/home/views/home.dart';
import 'package:comfypet/app/views/provider/pet/views/pet_add.dart';
import 'package:comfypet/app/views/provider/pet/views/pet_detail.dart';
import 'package:comfypet/app/views/provider/user/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MainAppProvider extends StatefulWidget {
  const MainAppProvider({super.key});

  @override
  State<MainAppProvider> createState() => _MainAppProviderState();
}

class _MainAppProviderState extends State<MainAppProvider> {
  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    log('provider * state');
    userProvider = UserProvider(userData: UserData());
    final petProvider = PetProvider(petData: PetsData());

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
        supportedLocales: const [Locale('es', 'ES')],
        initialRoute: MyStorage().uid.isNotEmpty ? 'home' : '/',
        routes: {
          '/': (context) => const LoginView(),
          'home': (context) => const HomeView(),
          'add': (context) => const PetAddView(),
          'petdetail': (context) => const PetDetailView(),
        },
      ),
    );
  }
}
