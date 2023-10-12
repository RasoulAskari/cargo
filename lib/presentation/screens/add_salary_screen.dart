import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Add Salary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                      .map((e) =>
                          {'value': e.id.toString(), 'label': e.firstName})
                      .toList(),
                  hintText: "Employee",
                );
              },
            ),
            const SizedBox(height: 30),
            CTextField(
              value: "",
              setValue: (value) {},
              hintText: "Amount of Salary",
            ),
            const SizedBox(height: 30),
            CDatePicker(
              setValue: (value) {},
              hintText: "Salary Date",
            ),
            const SizedBox(height: 30),
            CTextField(
              value: "",
              setValue: (value) {},
              hintText: "Amount Pay",
            ),
            const SizedBox(height: 30),
            CTextField(
              value: "",
              setValue: (value) {},
              hintText: "Amount Remain",
            )
          ],
        ),
      ),
    );
  }
}
