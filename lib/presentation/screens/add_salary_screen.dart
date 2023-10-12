import 'package:flutter/material.dart';

class AddSalaryScreen extends StatefulWidget {
  const AddSalaryScreen({super.key});

  @override
  State<AddSalaryScreen> createState() => _AddSalaryScreenState();
}

class _AddSalaryScreenState extends State<AddSalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 40,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
