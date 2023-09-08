import 'package:comfypet/app/pet/domain/pet.provider.dart';
import 'package:comfypet/app/user/domain/user.provider.dart';
import 'package:comfypet/app/user/ui/views/login.dart';
import 'package:comfypet/config/components/styles/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PetProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comfypet',
        home: const LoginView(),
        theme: themeData,
      ),
    );
  }
}
