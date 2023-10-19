import 'package:flutter/material.dart';

class ActionCheckBox extends StatefulWidget {
  final String value;
  final Function setValue;
  const ActionCheckBox({
    super.key,
    required this.value,
    required this.setValue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ActionCheckBoxState createState() => _ActionCheckBoxState();
}

class _ActionCheckBoxState extends State<ActionCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isChecked,
            onChanged: (val) {
              print(val);
              setState(() {
                isChecked = val as bool;
              });
              widget.setValue(widget.value);
            },
          ),
          Expanded(
              child: Text(
            widget.value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
