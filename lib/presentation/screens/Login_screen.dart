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
      children: [
        CTextField(
          value: 'admin@admin.com',
          setValue: () {},
        ),
        CTextField(
          value: 'password',
          setValue: (value) {
            print(value);
          },
        ),
      ],
    ));
  }
}
