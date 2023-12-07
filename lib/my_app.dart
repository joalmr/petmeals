import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/user/data/datasources/user_data.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:petmeals/config/components/styles/themes/theme.dart';
import 'package:petmeals/config/routers/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider(userData: UserData());
    final petProvider = PetProvider(petData: PetsData());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => userProvider),
        ChangeNotifierProvider(create: (_) => petProvider, lazy: true),
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
