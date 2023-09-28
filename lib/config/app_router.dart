import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/presentation/screens/add_employee.dart';
import 'package:cargo/presentation/screens/add_incoming_out_going_screen.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/incoming_out_going_screen.dart';
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
        EmployeeModel? employee;
        settings.arguments != null
            ? employee = settings.arguments as EmployeeModel?
            : null;
        return MaterialPageRoute(
            builder: (context) => AddEmployee(
                  employee: employee,
                ));
      case employeeScreen:
        return MaterialPageRoute(
          builder: (context) => const EmployeeScreen(),
        );
      case addIncomingOutGoing:
        return MaterialPageRoute(
          builder: (context) => const AddIncomingOutGoingScreen(),
        );
      case inconingOutGoingScreen :
        return MaterialPageRoute(
          builder: (context) => const IncomingOutGoingScreen(),
        );
      default:
        return null;
    }
  }
}
