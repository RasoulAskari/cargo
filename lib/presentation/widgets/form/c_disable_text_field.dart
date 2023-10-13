import 'package:flutter/material.dart';

class CDisableTextField extends StatefulWidget {
  final String value;
  final Function setValue;
  final String? hintText;
  final String? errorText;
  final int? maxlines;
  final Color? errorColor;
  final TextInputType? textInputType;
  const CDisableTextField({
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
  State<CDisableTextField> createState() => _CDisableTextFieldState();
}

class _CDisableTextFieldState extends State<CDisableTextField> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController()..text = widget.value;

    return TextFormField(
      enabled: false,
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
