import 'package:cargo/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CTextField(
            hintText: "Email",
            value: '',
            maxlines: 1,
            setValue: (value) {
              print(value);
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CTextField(
            hintText: "Password",
            value: '',
            maxlines: 1,
            setValue: (value) {
              print(value);
            },
          ),
        ),
      ],
    ));
  }
}
