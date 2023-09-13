import 'package:cargo/constants/routes.dart';
import 'package:cargo/presentation/screens/Login_screen.dart';
import 'package:cargo/presentation/screens/add_employee.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case addEmployee:
        return MaterialPageRoute(builder: (context) => AddEmployee());
      case employeeScreen:
        return MaterialPageRoute(builder: (context) => EmployeeScreen());
      default:
        return null;
    }
  }
}
