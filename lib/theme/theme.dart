import 'package:flutter/material.dart';

class AppTheme {
  //Theme Light
  static const Color lightPrimaryColorLight = Colors.black;
  static const Color lightPrimaryColor = Colors.purpleAccent;
  static const Color lightscaffoldBackgroundColor = Colors.white;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: lightPrimaryColor,
    primaryColorLight: lightPrimaryColorLight,
    appBarTheme: const AppBarTheme(
        color: lightPrimaryColor,
        elevation: 0,
        foregroundColor: lightscaffoldBackgroundColor),
    scaffoldBackgroundColor: lightscaffoldBackgroundColor,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: lightPrimaryColor)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: lightPrimaryColor, elevation: 5),
  );

//Theme dark
  static const Color darktPrimaryColorLight = Colors.grey;
  static const Color darkPrimaryColor = Colors.blue;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: darkPrimaryColor,
      primaryColorLight: darktPrimaryColorLight,
      appBarTheme: const AppBarTheme(color: darkPrimaryColor, elevation: 0));
}
