import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/incoming_out_going_type.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class AddSalaryScreen extends StatefulWidget {
  const AddSalaryScreen({super.key});

  @override
  State<AddSalaryScreen> createState() => _AddSalaryScreenState();
}

class _AddSalaryScreenState extends State<AddSalaryScreen> {
  DateTime? _date;
  IncomingOutGoingType _employee = const IncomingOutGoingType.pure();
  Amount _amount = const Amount.pure();
  Amount _amountPay = const Amount.pure();
  Amount _amountRemain = const Amount.pure();

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
                  value: _employee.value,
                  setValue: (value) {
                    _employee = IncomingOutGoingType.dirty(value);
                  },
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
              textInputType: TextInputType.number,
              value: _amount.value.toString(),
              setValue: (value) {
                _amount = Amount.dirty(value);
              },
              hintText: "Salary Amount",
            ),
            const SizedBox(height: 30),
            CDatePicker(
              value: _date,
              setValue: (value) {
                setState(() {
                  _date = value;
                });
              },
              hintText: "Salary Date",
            ),
            const SizedBox(height: 30),
            CTextField(
              value: _amountPay.value.toString(),
              setValue: (value) {
                double val;
                if (value == "") {
                  val = 1;
                } else {
                  val = double.parse(value);
                }

                _amountPay = Amount.dirty(val);
              },
              hintText: "Amount Pay",
            ),
            const SizedBox(height: 30),
            CTextField(
              value: _amountPay.value.toString(),
              setValue: (value) {
                double val;
                if (value == "") {
                  val = 1;
                } else {
                  val = double.parse(value);
                }

                _amount = Amount.dirty(val);
              },
              hintText: "Amount Remain",
            )
          ],
        ),
      ),
    );
  }
}
