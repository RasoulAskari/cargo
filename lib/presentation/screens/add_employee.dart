import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/cubit/employee_cubit.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/presentation/widgets/employee_stepper/step1.dart';
import 'package:cargo/presentation/widgets/employee_stepper/step2.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:toast/toast.dart';

class AddEmployee extends StatefulWidget {
  final EmployeeModel? employee;
  const AddEmployee({super.key, this.employee});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var step = 1;
  bool loading = false;

  next(steps) {
    var valid = steps[step - 1]['validate']();

    if (valid) {
      setState(() {
        step = step + 1;
      });
    } else {
      Toast.show("fill required fields");
    }
  }

  @override
  void initState() {
    super.initState();
    _checkEmployee();
  }

  prev(steps) {
    if (step == 1) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      step = step - 1;
    });
  }

  _checkEmployee() {
    if (widget.employee != null) {
      String p = widget.employee!.phoneNumber.substring(0, 3);
      String s = widget.employee!.phoneNumber.substring(0, 2);

      String? pho = s == "+1"
          ? PhoneNumber.getISO2CodeByPrefix(s)
          : PhoneNumber.getISO2CodeByPrefix(p);

      context.read<EmployeeCubit>().firstnameChange(widget.employee!.firstName);
      context.read<EmployeeCubit>().lastnameChange(widget.employee!.lastName);
      context.read<EmployeeCubit>().emailChange(widget.employee!.email);
      context.read<EmployeeCubit>().phoneNumberChange(PhoneNumber(
          phoneNumber: widget.employee!.phoneNumber,
          dialCode: p,
          isoCode: pho));
      context
          .read<EmployeeCubit>()
          .currentAddressChange(widget.employee!.currentAddress);
      context
          .read<EmployeeCubit>()
          .premenentAddressChange(widget.employee!.permenentAddress);
      context.read<EmployeeCubit>().startDateChange(widget.employee!.startDate);
      context.read<EmployeeCubit>().endDateChange(widget.employee!.endDate);
    }
  }

  Future<void> _editEmployee() async {
    final employee = context.read<EmployeeCubit>().state;
    EmployeeModel emp = EmployeeModel(
      salary: employee.salary.value,
      id: widget.employee!.id,
      currentAddress: employee.currentAddress.value,
      permenentAddress: employee.premenentAddress.value,
      startDate: employee.startDate.value,
      endDate: employee.endDate.value,
      jobTitle: "Developer",
      firstName: employee.firstname.value,
      lastName: employee.lastname.value,
      email: employee.email.value,
      phoneNumber: employee.phoneNo.value.phoneNumber,
      profile: '',
    );

    context.read<EmployeeBloc>().add(EditEmployeeEvent(employee: emp));
    Navigator.of(context).pop();
  }

  Future<void> _addEmployee() async {
    final employee = context.read<EmployeeCubit>().state;

    EmployeeModel emp = EmployeeModel(
      salary: employee.salary.value,
      id: 1,
      currentAddress: employee.currentAddress.value,
      permenentAddress: employee.premenentAddress.value,
      startDate: employee.startDate.value,
      endDate: employee.endDate.value,
      jobTitle: "Developer",
      firstName: employee.firstname.value,
      lastName: employee.lastname.value,
      email: employee.email.value,
      phoneNumber: employee.phoneNo.value.phoneNumber,
      profile: '',
    );
    context.read<EmployeeBloc>().add(AddEmployeeEvent(employee: emp));
    Navigator.of(context).pop();
  }

  validation1() {
    var state = context.read<EmployeeCubit>().state;
    bool status = Formz.validate([
      state.firstname,
      state.lastname,
      state.email,
      state.salary,
      state.phoneNo
    ]);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    List steps = [
      {
        'title': AppLocalizations.of(context)?.order_step1_title,
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
      {
        'title': AppLocalizations.of(context)?.order_step2_title,
        'step': Step2(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CStepper(
        stepAmount: 3,
        steps: steps,
        step: step,
        next: () {
          next(steps);
        },
        onSubmit: () async {
          widget.employee != null ? _editEmployee() : _addEmployee();
        },
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
