import 'package:cargo/presentation/widgets/c_text_field.dart';
import 'package:cargo/presentation/widgets/first_name.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cargo/logic/form_models/models.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  FirstName name = const FirstName.pure();
  PhoneNo phoneNo = const PhoneNo.pure();
  bool isValid = false;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            CTextField(
              value: name.value,
              setValue: (passedValue) {
                setState(() {
                  name = FirstName.dirty(passedValue);
                });
              },
              hintText: "FirstName",
              errorText: name.isNotValid ? "error" : null,
            ),
            const SizedBox(height: 15),
            CTextField(
              hintText: '',
              value: 'Lasttname',
              setValue: (value) {},
            ),
            const SizedBox(height: 15),
            CTextField(
              value: 'Email',
              setValue: (value) {},
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
              maxlines: 3,
              value: 'Current Address',
              setValue: (value) {},
            ),
            const SizedBox(height: 15),
            CTextField(
              maxlines: 3,
              value: 'Permenent Address',
              setValue: (value) {},
            ),
            const SizedBox(height: 15),
            CDatePicker(
              setValue: (value) {},
              hintText: 'Start Data',
            ),
            const SizedBox(height: 15),
            CDatePicker(
              setValue: (value) {},
              hintText: 'End Date',
            )
          ],
        ),
      ),
    );
  }
}
