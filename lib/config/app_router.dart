import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:cargo/presentation/screens/add_employee.dart';
import 'package:cargo/presentation/screens/add_exchange_money_screen.dart';
import 'package:cargo/presentation/screens/add_incoming_out_going_screen.dart';
import 'package:cargo/presentation/screens/add_order_screen.dart';
import 'package:cargo/presentation/screens/add_salary_screen.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/exchange_money_screen.dart';
import 'package:cargo/presentation/screens/incoming_out_going_screen.dart';
import 'package:cargo/presentation/screens/main_screen.dart';
import 'package:cargo/presentation/screens/order_screen.dart';
import 'package:cargo/presentation/screens/salary_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
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
        IncomingOutGoing? incoming;
        settings.arguments != null
            ? incoming = settings.arguments as IncomingOutGoing?
            : null;

        return MaterialPageRoute(
          builder: (context) => AddIncomingOutGoingScreen(
            incomingOutGoing: incoming,
          ),
        );
      case inconingOutGoingScreen:
        return MaterialPageRoute(
          builder: (context) => const IncomingOutGoingScreen(),
        );
      case ordersScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        );
      case addOrdersScreen:
        return MaterialPageRoute(
          builder: (context) => const AddOrderScreen(),
        );
      case salaryScreen:
        return MaterialPageRoute(
          builder: (context) => const SalaryScreen(),
        );
      case addSalaryScreen:
        return MaterialPageRoute(
          builder: (context) => const AddSalaryScreen(),
        );
      case exchangeMoneyScreen:
        return MaterialPageRoute(
          builder: (context) => const ExchangeMoneyScreen(),
        );
      case addExchangeMoneyScreen:

        return MaterialPageRoute(
          builder: (context) => const AddExchangeMoneyScreen(),
        );

      default:
        return null;
    }
  }
}
