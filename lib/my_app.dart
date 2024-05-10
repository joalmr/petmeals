import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/user/domain/usecases/user_usecase.dart';
import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:petmeals/config/routers/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider(userUsecase: getIt<UserUsecase>());
    final petProvider = PetProvider(petUseCase: getIt<PetUseCase>());

    // final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => userProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => petProvider,
          lazy: true,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Petmeals',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: kPrimaryColor,
            selectionColor: kPrimaryColor,
            selectionHandleColor: kPrimaryColor,
          ),
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: kPrimaryColor,
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', 'ES')],
        routerConfig: goRouter,
      ),
    );
  }
}
