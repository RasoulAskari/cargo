import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("data"),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
