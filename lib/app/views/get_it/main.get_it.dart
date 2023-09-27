import 'dart:developer';
import 'package:comfypet/app/views/get_it/home/views/home.dart';
import 'package:comfypet/app/views/get_it/pet/views/pet_add.dart';
import 'package:comfypet/app/views/get_it/pet/views/pet_detail.dart';
import 'package:comfypet/app/views/get_it/user/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainAppGetIt extends StatelessWidget {
  const MainAppGetIt({super.key});

  @override
  Widget build(BuildContext context) {
    log('get_it * state');
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
  }
}
