import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xffff711b, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffff711b), //10%
      100: Color(0xffff711b), //20%
      200: Color(0xffff711b), //30%
      300: Color(0xffff711b), //40%
      400: Color(0xffff711b), //50%
      500: Color(0xffff711b), //60%
      600: Color(0xffff711b), //70%
      700: Color(0xffff711b), //80%
      800: Color(0xffff711b), //90%
      900: Color(0xffff711b), //100%
    },
  );

  static const MaterialColor kTolight = MaterialColor(
    0xff202020, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff202020), //10%
      100: Color(0xff343434), //20%
      200: Color(0x33ff711b), //30%
      300: Color(0x33ff711b), //40%
      400: Color(0x33ff711b), //50%
      500: Color(0x33ff711b), //60%
      600: Color(0x33ff711b), //70%
      700: Color(0x33ff711b), //80%
      800: Color(0x33ff711b), //90%
      900: Color(0x33ff711b), //100%
    },
  );
  static const MaterialColor kToGrey = MaterialColor(
    0XFFF4F4F4, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{},
  );
}
