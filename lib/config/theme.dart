import 'package:flutter/material.dart';
import './colors.dart';


enum AppTheme { darkTheme, lightTheme }


class AppThemes{
 static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      fontFamily: 'Fredoka',
      textTheme:  ,
      iconTheme: ,
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