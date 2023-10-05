import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step1({super.key, required this.next, required this.prev});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  PhoneNo phoneNo = const PhoneNo.pure();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          CTextField(value: "", hintText: "Group Number", setValue: () {}),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "Name", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "Father Name", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "Grand Father Name", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "ID Card Number", setValue: () {}),
          const SizedBox(height: 30),
          CPhoneField(
              hintText: "Phone Num",
              setValue: (value) {},
              setValid: () {},
              value: phoneNo.value),
          const SizedBox(height: 30),
          CTextField(
            hintText: "Price",
            value: "",
            setValue: (value) {},
            textInputType: TextInputType.number,
          )
        ],
      ),
    );
  }
}
