import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          print(state.employees);
          return Center(
            child: Text("Employee Screen"),
          );
        },
      ),
    );
  }
}
