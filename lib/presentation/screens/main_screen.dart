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
  final _storeage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    final exist = await _storeage.read(key: 'token');

    if (exist != null) {
      setState(() {
        login = true;
      });
    } else {
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
