import 'package:cargo/logic/exchange_money/bloc/bloc/exchange_money_bloc.dart';
import 'package:cargo/logic/exchange_money/cubit/cubit/exchange_money_cubit.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/presentation/widgets/exchange_money_steps/step1.dart';
import 'package:cargo/presentation/widgets/exchange_money_steps/step2.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

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
      resizeToAvoidBottomInset: false,
      body: CStepper(
        stepAmount: 2,
        steps: steps,
        step: step,
        next: () {
          next(steps);
        },
        onSubmit: () async {
          final state = context.read<ExchangeMoneyCubit>().state;

          ExchnageMoneyModel exchangeMoney = ExchnageMoneyModel(
            id: 0,
            province: state.province.value,
            amount: state.amount.value,
            currency: state.currency.value,
            date: state.date.value,
            exchnageId: state.exchangeId.value,
            phoneNumber: state.phoneNumber.value.phoneNumber,
            receiverIdNo: 12,
            receiverName: state.receiverName.value,
            receiverFathername: state.receiverFathername.value,
            senderName: state.senderName.value,
          );
          context
              .read<ExchangeMoneyBloc>()
              .add(AddExchangeMoneyEvent(exchangeMoney: exchangeMoney));
        },
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
