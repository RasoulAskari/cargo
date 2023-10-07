import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/presentation/widgets/order_steps/step1.dart';
import 'package:cargo/presentation/widgets/order_steps/step2.dart';
import 'package:cargo/presentation/widgets/order_steps/step3.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
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
      {
        'title': "Info About Item",
        'step': Step3(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CStepper(
        stepAmount: 3,
        steps: steps,
        step: step,
        next: () {
          next(steps);
        },
        onSubmit: () {
          final name = context.read<OrderCubit>().state.customerName;
          print(name);
        },
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
