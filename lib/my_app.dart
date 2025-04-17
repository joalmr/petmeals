import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:petmeals/src/core/styles/themes/theme.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/user/presentation/providers/user_provider.dart';
import 'package:petmeals/src/core/routers/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance.get<UserProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetIt.instance.get<PetProvider>(),
          // lazy: true,
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
