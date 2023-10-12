import 'package:cargo/app.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/logic/order/bloc/bloc/order_bloc.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/logic/order/cubit/cubit/order_item_cubit.dart';
import 'package:cargo/logic/salary/bloc/salary_bloc.dart';
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
      BlocProvider<OrderCubit>(create: (context) => OrderCubit()),
      BlocProvider<OrderItemCubit>(create: (context) => OrderItemCubit())
    ], child: const CargoApp());
  }
}
