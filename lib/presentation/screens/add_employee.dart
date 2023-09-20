import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/form_models/address.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/first_name.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  FirstName fristname = const FirstName.pure();
  FirstName lastname = const FirstName.pure();
  PhoneNo phoneNo = const PhoneNo.pure();
  Email email = const Email.pure();
  Address currentAddress = const Address.pure();
  Address premenentAddress = const Address.pure();
  DateTime? startDate;
  DateTime? endDate;
  bool isValid = false;

  String? getNameError(FullNameValidationError? error) {
    switch (error) {
      case FullNameValidationError.empty:
        return "Empty";
      case FullNameValidationError.min:
        return "Name must be at least 6 character";
      case FullNameValidationError.max:
        return "Name should not be more than 32 character";

      default:
    }
    return null;
  }

  Future<void> addEmployee() async {
    EmployeeModel emp = EmployeeModel(
      currentAddress: currentAddress.value,
      permenentAddress: premenentAddress.value,
      startDate: startDate.toString(),
      endDate: endDate.toString(),
      jobTitle: "Developer",
      firstName: fristname.value,
      lastName: lastname.value,
      email: email.value,
      phoneNumber: phoneNo.value.toString(),
      profile: '',
    );

    context.read<EmployeeBloc>().add(AddEmployeeEvent(employee: emp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Add Employee",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => EmployeeBloc(httpClient: http.Client()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              CTextField(
                value: fristname.value,
                setValue: (passedValue) {
                  setState(() {
                    fristname = FirstName.dirty(passedValue);
                  });
                },
                hintText: "FirstName",
                errorText: fristname.isNotValid ? "error" : null,
              ),
              const SizedBox(height: 15),
              CTextField(
                value: lastname.value,
                setValue: (lastnameValue) {
                  setState(() {
                    lastname = FirstName.dirty(lastnameValue);
                  });
                },
                hintText: "FirstName",
                errorText: lastname.isNotValid ? "error" : null,
              ),
              const SizedBox(height: 15),
              CTextField(
                value: email.value,
                setValue: (emailValue) {
                  setState(() {
                    email = Email.dirty(emailValue);
                  });
                },
                hintText: "Email",
                errorText: email.isNotValid ? "error" : null,
              ),
              const SizedBox(height: 15),
              CPhoneField(
                hintText: "phoneNo",
                setValue: (PhoneNumber phone) {
                  setState(() {
                    phoneNo = PhoneNo.dirty(phone);
                  });
                },
                setValid: (bool? isValidPassed) {
                  setState(() {
                    isValid = isValidPassed ?? false;
                  });
                },
                value: phoneNo.value,
              ),
              const SizedBox(height: 15),
              CTextField(
                hintText: "Current Address",
                maxlines: 3,
                value: currentAddress.value,
                setValue: (value) {
                  setState(() {
                    currentAddress = Address.dirty(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              CTextField(
                hintText: "Premenent Address",
                maxlines: 3,
                value: premenentAddress.value,
                setValue: (value) {
                  setState(() {
                    premenentAddress = Address.dirty(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              CDatePicker(
                setValue: (value) {
                  setState(() {
                    startDate = value;
                  });
                },
                hintText: 'Start Data',
              ),
              const SizedBox(height: 15),
              CDatePicker(
                setValue: (value) {
                  setState(() {
                    endDate = value;
                  });
                },
                hintText: 'End Date',
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  addEmployee();
                },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
