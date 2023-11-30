import 'package:cargo/app.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/cubit/employee_cubit.dart';
import 'package:cargo/logic/exchange_money/bloc/bloc/exchange_money_bloc.dart';
import 'package:cargo/logic/exchange_money/cubit/cubit/exchange_money_cubit.dart';
import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/logic/language/cubit/language_cubit.dart';
import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/logic/order/bloc/bloc/order_bloc.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/logic/order/cubit/cubit/order_item_cubit.dart';
import 'package:cargo/logic/salary/bloc/salary_bloc.dart';
import 'package:cargo/logic/user/bloc/user_bloc.dart';
import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages

void main() => runApp(const MyApp());

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
      BlocProvider<IncomingOutGoingBloc>(
        create: (context) => IncomingOutGoingBloc(
          httpClient: http.Client(),
        )..add(IncomingOutGoingFetchEvent()),
      ),
      BlocProvider<OrderBloc>(
        create: (context) => OrderBloc(
          httpClient: http.Client(),
        )..add(FetchOrderEvent()),
      ),
      BlocProvider<SalaryBloc>(
        create: (context) => SalaryBloc(
          httpClient: http.Client(),
        )..add(FetchSalaryEvent()),
      ),
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(
          httpClient: http.Client(),
        )..add(FetchUserEvent()),
      ),
      BlocProvider<ExchangeMoneyBloc>(
        create: (context) => ExchangeMoneyBloc(
          httpClient: http.Client(),
        )..add(FetchExchangeMoneyEvent()),
      ),
      BlocProvider<OrderCubit>(
        create: (context) => OrderCubit(),
      ),
      BlocProvider<OrderItemCubit>(
        create: (context) => OrderItemCubit(),
      ),
      BlocProvider<ExchangeMoneyCubit>(
        create: (context) => ExchangeMoneyCubit(),
      ),
      BlocProvider<LanguageCubit>.value(
        value: LanguageCubit(),
      ),
      BlocProvider<EmployeeCubit>(
        create: (context) => EmployeeCubit(),
      ),
      BlocProvider<UserCubit>(
        create: (context) => UserCubit(),
      )
    ], child: const CargoApp());
  }
}
