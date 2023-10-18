import 'package:cargo/presentation/widgets/user_stepper/step2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/stepper/c_stepper.dart';
import '../widgets/user_stepper/step.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  late http.Client httpClient;

  var step = 1;
  bool loading = false;

  next(steps) {
    setState(() {
      step = step + 1;
    });
  }

  prev(steps) {
    if (step == 1) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      step = step - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List steps = [
      {
        'title': "Info About The Person\nwhom Order ",
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
      {
        'title': "Info About The Receiver",
        'step': Step2(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CStepper(
            prev: () {
              prev(steps);
            },
            loading: loading,
            stepAmount: 3,
            steps: steps,
            step: step,
            next: () {
              next(steps);
            },
            onSubmit: () async {}));
  }
}
