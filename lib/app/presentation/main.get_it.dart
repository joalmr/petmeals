import 'dart:developer';
import 'package:petmeals/app/presentation/routers/routes.dart';
import 'package:petmeals/config/components/styles/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainAppGetIt extends StatelessWidget {
  const MainAppGetIt({super.key});

  @override
  Widget build(BuildContext context) {
    log('get_it * state');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Petmeals',
      theme: themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es', 'ES')],
      routerConfig: goRouter,
    );
  }
}
