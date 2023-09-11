import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _stoage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Employee Screen",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state.status == EmployeeStatus.initial) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                return Text(state.employees[index].firstName);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _stoage.delete(key: 'token');
        },
        child: Icon(Icons.logout_outlined),
      ),
    );
  }
}
