import 'dart:developer';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/app/domain/cubit.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainAppCubit extends StatelessWidget {
  const MainAppCubit({super.key});
  @override
  Widget build(BuildContext context) {
    log('cubit * state');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(userData: UserData())),
        BlocProvider(create: (context) => PetCubit(petData: PetsData())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Comfypet',
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
