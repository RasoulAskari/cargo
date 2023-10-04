import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CStepper(
          stepAmount: 5,
          steps: steps,
          step: step,
          next: () {
            next(steps);
          },
          onSubmit: () {
            onSubmit();
          },
          prev: () {
            prev(steps);
          },
          loading: loading,
        ),
      ),;
  }
}
