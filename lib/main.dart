import 'package:cargo/app.dart';
import 'package:cargo/config/app_router.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/presentation/screens/employee_screen.dart';
import 'package:cargo/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          httpClient: http.Client(),
        ),
      ),
      BlocProvider<EmployeeBloc>(
        create: (context) => EmployeeBloc(
          httpClient: http.Client(),
        )..add(EmployeesFetched()),
      ),
    ], child: CargoApp());
  }
}
