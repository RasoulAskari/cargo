import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class AddSalaryScreen extends StatefulWidget {
  const AddSalaryScreen({super.key});

  @override
  State<AddSalaryScreen> createState() => _AddSalaryScreenState();
}

class _AddSalaryScreenState extends State<AddSalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 40,
        ),
        child: Column(
          children: [
            BlocBuilder<EmployeeBloc, EmployeeState>(
              builder: (context, state) {
                return CDropdown(
                  setValue: (value) {},
                  items: state.employees
                      .map((e) => {'value': e.id, 'label': e.firstName})
                      .toList(),
                  hintText: "Employee",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
