import 'package:cargo/config/app_router.dart';
import 'package:cargo/config/theme.dart';
import 'package:cargo/presentation/screens/Login_screen.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CargoApp extends StatefulWidget {
  const CargoApp({super.key});

  @override
  State<CargoApp> createState() => _CargoAppState();
}

class _CargoAppState extends State<CargoApp> {
  bool login = false;

  final _storeage = const FlutterSecureStorage();

  @override
  void initState() {
    isLogin();
    super.initState();
  }

  void isLogin() async {
    final exist = await _storeage.read(key: 'token');
    print(exist);
    if (exist != null) {
      setState(() {
        login = true;
      });
    } else {
      login = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.appThemeData[AppTheme.lightTheme],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: "Cargo",
    );
  }
}
