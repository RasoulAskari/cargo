import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return null;
    }
  }
}
