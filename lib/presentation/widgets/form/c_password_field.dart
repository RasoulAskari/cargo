import 'package:flutter/material.dart';

class CPasswordField extends StatefulWidget {
  final String value;
  final Function setValue;
  final String? hintText;

  const CPasswordField({
    super.key,
    required this.value,
    required this.setValue,
    this.hintText,
  });

  @override
  State<CPasswordField> createState() => _CPasswordFieldState();
}

class _CPasswordFieldState extends State<CPasswordField> {
  bool _passwordVisible = false;
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController()..text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        widget.setValue(value);
      },
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: "password",
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
        suffixIcon: InkWell(
          onTap: () => {
            setState(() {
              _passwordVisible = !_passwordVisible;
            })
          },
          child: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
