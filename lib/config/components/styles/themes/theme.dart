import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: fondoColor,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 26.0),
    titleLarge: TextStyle(fontSize: 20.0),
    titleMedium: TextStyle(fontSize: 16.0),
    titleSmall: TextStyle(fontSize: 14.0),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primerColor),
  colorSchemeSeed: primerColor,
);
