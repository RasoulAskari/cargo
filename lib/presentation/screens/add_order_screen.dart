import 'package:cargo/presentation/widgets/order_steps/step1.dart';
import 'package:cargo/presentation/widgets/order_steps/step2.dart';
import 'package:cargo/presentation/widgets/order_steps/step3.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {



    List steps = [
      {
        'title': "Fill your Account \nInformation",
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': validateStep1
      },
      {
        'title': "Tell Us More\n About yourself",
        'step': Step2(
          next: next,
          prev: prev,
        ),
        'validate': validateStep2
      },
      {
        'title': "Tell Us More\n About yourself",
        'step': Step3(
          next: next,
          prev: prev,
        ),
        'validate': validateStep3
      },
      {
        'title': "Enable \nGeo Location",
        'step': Step4(
          next: next,
          prev: prev,
        ),
        'validate': validateStep4
      },
      {
        'title': "Review \nOur Privacy Policy",
        'step': Step5(
          next: next,
          prev: prev,
        ),
        'validate': validateStep5
      },
    ];


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
