import 'package:flutter/material.dart';

class ActionCheckBox extends StatefulWidget {
  const ActionCheckBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActionCheckBoxState createState() => _ActionCheckBoxState();
}

class _ActionCheckBoxState extends State<ActionCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue!;
            });
          },
        ),
        Text('Check this box'),
      ],
    );
  }
}
