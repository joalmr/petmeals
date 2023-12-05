import 'package:petmeals/config/routers/routes.dart';
import 'package:petmeals/config/components/styles/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainAppGetIt extends StatelessWidget {
  const MainAppGetIt({super.key});

  @override
  Widget build(BuildContext context) {
    userProvider = UserProvider(userData: UserData());
    final petProvider = PetProvider(petData: PetsData());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => userProvider),
        ChangeNotifierProvider(create: (_) => petProvider, lazy: true),
      ],
      child: return MaterialApp.router(
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
