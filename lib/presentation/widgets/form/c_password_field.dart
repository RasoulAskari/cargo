import 'package:flutter/material.dart';

class CPasswordField extends StatefulWidget {
  final 
  const CPasswordField({super.key});

  @override
  State<CPasswordField> createState() => _CPasswordFieldState();
}

class _CPasswordFieldState extends State<CPasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
