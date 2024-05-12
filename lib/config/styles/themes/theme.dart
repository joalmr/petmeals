import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petmeals/config/styles/colors/colors.dart';

ThemeData themeData = ThemeData(
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
);
