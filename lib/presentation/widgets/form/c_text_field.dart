import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CTextField extends StatefulWidget {
  final String value;
  final Function setValue;
  final String? hintText;
  final String? errorText;
  final int? maxlines;
  final Color? errorColor;
  final TextInputType? textInputType;
  const CTextField({
    super.key,
    required this.value,
    required this.setValue,
    this.hintText,
    this.errorText,
    this.maxlines,
    this.errorColor,
    this.textInputType,
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController()..text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      maxLines: widget.maxlines,
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: widget.errorColor != null
            ? TextStyle(color: widget.errorColor)
            : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      onChanged: (value) {
        widget.setValue(value);
      },
    );
  }
}
