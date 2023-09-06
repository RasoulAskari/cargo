import 'package:cargo/config/app_router.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:flutter/material.dart';

class CargoApp extends StatefulWidget {
  const CargoApp({super.key});

  @override
  State<CargoApp> createState() => _CargoAppState();
}

  bool login = false;

class _CargoAppState extends State<CargoApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: "Cargo",
      home: EmployeeScreen(),
    );
  }
}
