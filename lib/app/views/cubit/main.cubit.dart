import 'dart:developer';
import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/app/domain/pet/cubit/pet_cubit.dart';
import 'package:comfypet/app/domain/user/cubit/user_cubit.dart';
import 'package:comfypet/app/views/cubit/home/views/home.dart';
import 'package:comfypet/app/views/cubit/pet/views/pet_add.dart';
import 'package:comfypet/app/views/cubit/pet/views/pet_detail.dart';
import 'package:comfypet/app/views/cubit/user/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          'add': (context) => PetAddView(),
          'petdetail': (context) => const PetDetailView(),
        },
      ),
    );
  }
}
