import 'dart:convert';

import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:cargo/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _getLanguage();
  }

  Future<String?> _getLanguage() async {
    final lang = await _storage.read(key: "language");

    // ignore: use_build_context_synchronously
    context.read<LanguageCubit>().changeLanguage(lang.toString());

    return lang;
  }

  void isLogin() async {
    try {
      final jsonModel = await _storage.read(key: 'user');
      final jsonData = jsonDecode(jsonModel.toString());

      print(jsonData);

      if (jsonData['user']['created_at'] != null && jsonData['token'] != null) {
        // DateTime created_at = DateTime.parse(jsonData['user']['created_at']);
        // DateTime n = DateTime.now();
        // n.difference(created_at).inDays;

        setState(() {
          login = true;
        });
      } else {
        setState(() {
          login = false;
        });
      }
    } catch (e) {
      setState(() {
        login = false;
      });
    }
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
