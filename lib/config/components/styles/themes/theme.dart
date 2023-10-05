import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: fondoColor,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 26),
    titleLarge: TextStyle(fontSize: 20),
    titleMedium: TextStyle(fontSize: 16),
    titleSmall: TextStyle(fontSize: 14),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primerColor),
  colorSchemeSeed: primerColor,
);
