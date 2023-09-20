import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/presentation/screens/add_employee.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case addEmployee:
        EmployeeModel employee = settings.arguments as EmployeeModel;
        return MaterialPageRoute(builder: (context) => const AddEmployee());
      case employeeScreen:
        return MaterialPageRoute(builder: (context) => const EmployeeScreen());
      default:
        return null;
    }
  }
}
