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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          CTextField(value: "", hintText: "Name", setValue: () {}),
        ],
      ),
    );
  }
}
