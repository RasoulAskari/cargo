import 'dart:convert';
import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:cargo/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool login = false;
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    try {
      final jsonModel = await _storage.read(key: 'user');
      final jsonData = jsonDecode(jsonModel.toString());

      if (jsonData['user']['created_at'] != null && jsonData['token'] != null) {
        setState(() {
          login = true;
        });
      } else {
        setState(() {
          login = false;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return login
        ? HomeScreen(
            isLogin: isLogin,
          )
        : LoginScreen(
            isLogin: isLogin,
          );
  }
}
