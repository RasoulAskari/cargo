import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/form_models/address.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/employee_stepper/step1.dart';
import 'package:cargo/presentation/widgets/employee_stepper/step2.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
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
    setState(() {
      step = step + 1;
    });
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

  // _checkEmployee() {
  //   if (widget.employee != null) {
  //     String p = widget.employee!.phoneNumber.substring(0, 3);
  //     String s = widget.employee!.phoneNumber.substring(0, 2);

  //     String? pho = s == "+1"
  //         ? PhoneNumber.getISO2CodeByPrefix(s)
  //         : PhoneNumber.getISO2CodeByPrefix(p);

  //     setState(() {
  //       firstname = FirstName.dirty(widget.employee!.firstName);
  //       lastname = FirstName.dirty(widget.employee!.lastName);
  //       email = Email.dirty(widget.employee!.email);
  //       phoneNo = PhoneNo.dirty(PhoneNumber(
  //           phoneNumber: widget.employee!.phoneNumber,
  //           dialCode: p,
  //           isoCode: pho));
  //       currentAddress = Address.dirty(
  //         widget.employee!.currentAddress,
  //       );
  //       premenentAddress = Address.dirty(widget.employee!.permenentAddress);
  //       startDate = DateTime.parse(widget.employee!.startDate);
  //       endDate = DateTime.parse(widget.employee!.endDate);
  //     });
  //   }
  // }

  // Future<void> _editEmployee() async {
  //   bool validation = firstname.isValid &&
  //       lastname.isValid &&
  //       phoneNo.isValid &&
  //       email.isValid &&
  //       currentAddress.isValid &&
  //       premenentAddress.isValid;

  //   EmployeeModel emp = EmployeeModel(
  //     salary: widget.employee!.salary,
  //     id: widget.employee!.id,
  //     currentAddress: currentAddress.value,
  //     permenentAddress: premenentAddress.value,
  //     startDate: startDate.toString(),
  //     endDate: endDate.toString(),
  //     jobTitle: "Developer",
  //     firstName: firstname.value,
  //     lastName: lastname.value,
  //     email: email.value,
  //     phoneNumber: phoneNo.value.phoneNumber,
  //     profile: '',
  //   );

  //   if (validation) {
  //     context.read<EmployeeBloc>().add(EditEmployeeEvent(employee: emp));
  //     Navigator.of(context).pop();
  //   } else {
  //     Toast.show("fill all input correctly!");
  //   }
  // }

  // String? getNameError(FullNameValidationError? error) {
  //   switch (error) {
  //     case FullNameValidationError.empty:
  //       return "Empty";
  //     case FullNameValidationError.min:
  //       return "Name must be at least 6 character";
  //     case FullNameValidationError.max:
  //       return "Name should not be more than 32 character";

  //     default:
  //   }
  //   return null;
  // }

  // Future<void> _addEmployee() async {
  //   EmployeeModel emp = EmployeeModel(
  //     id: 1,
  //     salary: 1200,
  //     currentAddress: currentAddress.value,
  //     permenentAddress: premenentAddress.value,
  //     startDate: startDate.toString(),
  //     endDate: endDate.toString(),
  //     jobTitle: "Developer",
  //     firstName: firstname.value,
  //     lastName: lastname.value,
  //     email: email.value,
  //     phoneNumber: phoneNo.value.phoneNumber,
  //     profile: '',
  //   );
  //   bool validation = firstname.isValid &&
  //       lastname.isValid &&
  //       phoneNo.isValid &&
  //       email.isValid &&
  //       currentAddress.isValid &&
  //       premenentAddress.isValid;

  //   if (validation) {
  //     context.read<EmployeeBloc>().add(AddEmployeeEvent(employee: emp));
  //     Navigator.of(context).pop();
  //   } else {
  //     Toast.show("fill all input correctly!");
  //   }
  // }

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
        onSubmit: () async {},
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
