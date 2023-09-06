import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      fontFamily: 'Fredoka',
      textTheme: lightTextTheme(),
      iconTheme: lightIconTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.kToDark,
        foregroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.red, //change your color here
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Palette.kToDark),
        ),
      ),
      primaryIconTheme: primaryIconTheme(),
      primaryColorLight: const Color(0x22FF711B),
      primarySwatch: Palette.kToDark,
      primaryColorDark: Colors.black54,
      brightness: Brightness.light,
    ),
    AppTheme.darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Palette.kTolight,
        fontFamily: 'Fredoka',
        textTheme: darkTextTheme(),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Palette.kToDark,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Palette.kToDark),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        iconTheme: darkIconTheme(),
        primaryIconTheme: primaryIconTheme(),
        primaryColorLight: Palette.kTolight,
        appBarTheme: const AppBarTheme(backgroundColor: Palette.kTolight),
        primarySwatch: Palette.kTolight,
        brightness: Brightness.dark)
  };
}

IconThemeData lightIconTheme() {
  return const IconThemeData(color: Palette.kToDark);
}

IconThemeData darkIconTheme() {
  return const IconThemeData(color: Colors.white);
}

IconThemeData primaryIconTheme() {
  return const IconThemeData(color: Colors.white, size: 30);
}

TextTheme lightTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(
        fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(
        fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        fontSize: 10, color: Colors.black, fontWeight: FontWeight.normal),
  );
}

TextTheme darkTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(
        fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(
        fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        fontSize: 10, color: Colors.white, fontWeight: FontWeight.normal),
  );
}
