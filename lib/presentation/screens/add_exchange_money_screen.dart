import 'package:cargo/presentation/widgets/exchange_money_steps/step1.dart';
import 'package:cargo/presentation/widgets/exchange_money_steps/step2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddExchangeMoneyScreen extends StatefulWidget {
  const AddExchangeMoneyScreen({super.key});

  @override
  State<AddExchangeMoneyScreen> createState() => _AddExchangeMoneyScreenState();
}

class _AddExchangeMoneyScreenState extends State<AddExchangeMoneyScreen> {
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Add Exchange money screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
