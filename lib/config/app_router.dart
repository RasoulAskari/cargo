import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:cargo/presentation/screens/add_employee.dart';
import 'package:cargo/presentation/screens/add_exchange_money_screen.dart';
import 'package:cargo/presentation/screens/add_incoming_out_going_screen.dart';
import 'package:cargo/presentation/screens/add_order_screen.dart';
import 'package:cargo/presentation/screens/add_salary_screen.dart';
import 'package:cargo/presentation/screens/add_user_screen.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/exchange_money_screen.dart';
import 'package:cargo/presentation/screens/incoming_out_going_screen.dart';
import 'package:cargo/presentation/screens/main_screen.dart';
import 'package:cargo/presentation/screens/order_screen.dart';
import 'package:cargo/presentation/screens/report_screen.dart';
import 'package:cargo/presentation/screens/salary_screen.dart';
import 'package:cargo/presentation/screens/setting_screen.dart';
import 'package:cargo/presentation/screens/user_screen.dart';
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
      case reportScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportScreen(),
        );
      case settingScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
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
        SalaryModel? salary;
        settings.arguments != null
            ? salary = settings.arguments as SalaryModel?
            : null;

        return MaterialPageRoute(
          builder: (context) => AddSalaryScreen(
            salary: salary,
          ),
        );
      case exchangeMoneyScreen:
        return MaterialPageRoute(
          builder: (context) => const ExchangeMoneyScreen(),
        );
      case userScreen:
        return MaterialPageRoute(
          builder: (context) => const UserScreen(),
        );
      case addUserScreen:
        MyUser? user;
        settings.arguments != null
            ? user = settings.arguments as MyUser?
            : null;

        return MaterialPageRoute(
          builder: (context) => AddUserScreen(user: user),
        );
      case addExchangeMoneyScreen:
        ExchnageMoneyModel? exchange;
        settings.arguments != null
            ? exchange = settings.arguments as ExchnageMoneyModel?
            : null;

        return MaterialPageRoute(
          builder: (context) => AddExchangeMoneyScreen(
            exchange: exchange,
          ),
        );

      default:
        return null;
    }
  }
}
