import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class ActionCheckBox extends StatefulWidget {
  final String value;
  final String data;
  final Function setValue;
  final List<String>? updateData;

  const ActionCheckBox({
    super.key,
    required this.value,
    required this.setValue,
    required this.data,
    this.updateData,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ActionCheckBoxState createState() => _ActionCheckBoxState();
}

class _ActionCheckBoxState extends State<ActionCheckBox> {
  bool isChecked = false;

  @override
  @override
  Widget build(BuildContext context) {
    if (widget.updateData!.isNotEmpty) {
      final da = widget.updateData!.contains(widget.data);
      if (da) {
        setState(() {
          isChecked = true;
        });
      }

      // var data = widget.updateData!.firstWhere(
      //   (element) => element == widget.value,
      // );
      // print(data);
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = val as bool;
              });
              widget.setValue({"data": widget.data, 'check': isChecked});
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
