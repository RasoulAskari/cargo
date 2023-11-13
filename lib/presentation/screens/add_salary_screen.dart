import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/salary/bloc/salary_bloc.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_disable_text_field.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/incoming_out_going_type.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import "package:flutter_bloc/flutter_bloc.dart";

class AddSalaryScreen extends StatefulWidget {
  final SalaryModel? salary;
  const AddSalaryScreen({super.key, this.salary});

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
  void initState() {
    super.initState();
    _checkSalary();
  }

  _checkSalary() {
    if (widget.salary != null) {
      final salary = widget.salary;

      _employee = IncomingOutGoingType.dirty(salary!.employee.id.toString());
      _date = DateTime.parse(salary.date);
      _amount = Amount.dirty(salary.salaryAmount);
      _amountPay = Amount.dirty(salary.payAmount);
      _amountRemain = Amount.dirty(salary.remainAmount);
    }
  }

  final a = TextEditingController();
  Future<void> _findSalary(int id, List<EmployeeModel> employees) async {
    EmployeeModel emp = employees.firstWhere((element) => element.id == id);
    setState(() {
      _amount = Amount.dirty(emp.salary);
    });
  }

  void _findRemainSalary(double salary, double pay) {
    setState(() {
      double amount = salary - pay;
      setState(() {
        _amountRemain = Amount.dirty(amount);
      });
    });
  }

  void _addSalary(EmployeeModel employee) {
    if (widget.salary == null) {
      context.read<SalaryBloc>().add(
            AddSalaryEvent(
              salary: SalaryModel(
                  id: 0,
                  employee: employee,
                  salaryAmount: _amount.value,
                  date: _date.toString(),
                  payAmount: _amountPay.value,
                  remainAmount: _amountRemain.value),
            ),
          );
    } else {
      context.read<SalaryBloc>().add(
            EditSalaryEvent(
              salary: SalaryModel(
                  id: widget.salary!.id,
                  employee: employee,
                  salaryAmount: _amount.value,
                  date: _date.toString(),
                  payAmount: _amountPay.value,
                  remainAmount: _amountRemain.value),
            ),
          );
    }
    Navigator.of(context).pushReplacementNamed(salaryScreen);
  }

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
        title: Text(
          AppLocalizations.of(context)!.add_salary_screen,
          style: const TextStyle(
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
        child: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InputLabel(label: AppLocalizations.of(context)!.employee),
                  CDropdown(
                    value: _employee.value,
                    setValue: (value) {
                      _employee = IncomingOutGoingType.dirty(value);
                      _findSalary(int.parse(value), state.employees);
                    },
                    items: state.employees
                        .map((e) => {
                              'value': e.id.toString(),
                              'label': e.firstName,
                            })
                        .toList(),
                    hintText: AppLocalizations.of(context)?.employee,
                  ),
                  InputLabel(label: AppLocalizations.of(context)!.amount),
                  CDisableTextField(
                    textInputType: TextInputType.number,
                    value: _amount.value.toString(),
                    setValue: (value) {
                      double val;
                      if (value == "") {
                        val = 1;
                      } else {
                        val = double.parse(value);
                      }

                      _amount = Amount.dirty(val);
                    },
                    hintText: AppLocalizations.of(context)?.amount,
                  ),
                  InputLabel(label: AppLocalizations.of(context)!.date),
                  CDatePicker(
                    value: _date,
                    setValue: (value) {
                      setState(() {
                        _date = value;
                      });
                    },
                    hintText: AppLocalizations.of(context)?.date,
                  ),
                  const SizedBox(height: 30),
                  CTextField(
                    errorText: _amountPay.isNotValid
                        ? getAmountError(_amountPay.error, context,
                            AppLocalizations.of(context)!.payment_amount)
                        : null,
                    value: _amountPay.value.toString(),
                    setValue: (value) {
                      double val;
                      if (value == "") {
                        val = 1;
                      } else {
                        val = double.parse(value);
                      }

                      _amountPay = Amount.dirty(val);
                      _findRemainSalary(_amount.value, val);
                    },
                    hintText: AppLocalizations.of(context)?.payment_amount,
                  ),
                  const SizedBox(height: 30),
                  CDisableTextField(
                    value: _amountRemain.value.toString(),
                    setValue: (value) {
                      double val;
                      if (value == "") {
                        val = 1;
                      } else {
                        val = double.parse(value);
                      }

                      _amount = Amount.dirty(val);
                    },
                    hintText: AppLocalizations.of(context)?.remain_amount,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      EmployeeModel emp = state.employees.firstWhere(
                          (element) =>
                              element.id == double.parse(_employee.value));
                      _addSalary(emp);
                    },
                    child: Text(AppLocalizations.of(context)!.add),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
