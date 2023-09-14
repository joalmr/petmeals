import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: fondoColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primerColor),
  // appBarTheme: AppBarTheme(
  //   centerTitle: false,
  //   elevation: 0,
  //   color: Colors.transparent,
  //   toolbarTextStyle: const TextTheme(
  //     titleLarge: TextStyle(
  //       fontWeight: FontWeight.w300,
  //     ),
  //   ).bodyMedium,
  //   titleTextStyle: const TextTheme(
  //     titleLarge: TextStyle(
  //       fontSize: 26, //28,
  //       fontWeight: FontWeight.w300,
  //     ),
  //   ).titleLarge,
  // ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 26.0),
    titleLarge: TextStyle(fontSize: 20.0),
    titleMedium: TextStyle(fontSize: 16.0),
    titleSmall: TextStyle(fontSize: 14.0),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),
);
