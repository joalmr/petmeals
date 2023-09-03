import 'package:comfypet/app/ui/pages/user/views/login.dart';
import 'package:comfypet/src/styles/themes/theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comfypet',
      home: const LoginView(),
      theme: themeData,
    );
  }
}
