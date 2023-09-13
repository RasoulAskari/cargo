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
    isLogin();
    super.initState();
  }

  void isLogin() async {
    final exist = await _storeage.read(key: 'token');
    print(exist.toString() + "call");
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
