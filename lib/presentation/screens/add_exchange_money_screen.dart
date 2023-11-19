import 'package:cargo/config/localization.dart';
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
// ignore: depend_on_referenced_packages
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

class AddExchangeMoneyScreen extends StatefulWidget {
  final ExchnageMoneyModel? exchange;
  const AddExchangeMoneyScreen({
    super.key,
    this.exchange,
  });

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
  void initState() {
    _checkExchange();
    super.initState();
  }

  _checkExchange() {
    if (widget.exchange != null) {
      String p = widget.exchange!.phoneNumber.substring(0, 3);
      String s = widget.exchange!.phoneNumber.substring(0, 2);

      String? pho = s == "+1"
          ? PhoneNumber.getISO2CodeByPrefix(s)
          : PhoneNumber.getISO2CodeByPrefix(p);

      final exchange = widget.exchange;
      context.read<ExchangeMoneyCubit>().dateChange(exchange!.date.toString());
      context.read<ExchangeMoneyCubit>().amountChange(exchange.amount);
      context.read<ExchangeMoneyCubit>().currencyChange(exchange.currency);
      context.read<ExchangeMoneyCubit>().exchangeIdChange(exchange.exchnageId);
      context.read<ExchangeMoneyCubit>().phoneNumberChange(PhoneNumber(
          phoneNumber: widget.exchange!.phoneNumber,
          dialCode: p,
          isoCode: pho));
      context.read<ExchangeMoneyCubit>().provinceChange(exchange.province);
      context
          .read<ExchangeMoneyCubit>()
          .receiverFatherNameChange(exchange.receiverFathername);
      context
          .read<ExchangeMoneyCubit>()
          .receiverNameChange(exchange.receiverName);
      context
          .read<ExchangeMoneyCubit>()
          .receiverFatherNameChange(exchange.senderName);
      context.read<ExchangeMoneyCubit>().senderNameChange(exchange.senderName);
    }
  }

  validation1() {
    var state = context.read<ExchangeMoneyCubit>().state;
    bool valid = Formz.validate([
      state.senderName,
      state.amount,
      state.date,
      state.exchangeId,
      state.currency
    ]);
    return valid;
  }

  validation2() {
  }

  @override
  Widget build(BuildContext context) {
    List steps = [
      {
        'title': AppLocalizations.of(context)?.exchange_money_step1_title,
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': validation1()
      },
      {
        'title': AppLocalizations.of(context)?.exchange_money_step2_title,
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
            id: widget.exchange != null ? widget.exchange!.id : 0,
            province: state.province.value,
            amount: state.amount.value,
            currency: state.currency.value,
            date: state.date.value,
            exchnageId: state.exchangeId.value,
            phoneNumber: state.phoneNumber.value.phoneNumber,
            receiverIdNo: state.receiverIdNo.value,
            receiverName: state.receiverName.value,
            receiverFathername: state.receiverFathername.value,
            senderName: state.senderName.value,
          );
          widget.exchange == null
              ? context.read<ExchangeMoneyBloc>().add(
                    AddExchangeMoneyEvent(exchangeMoney: exchangeMoney),
                  )
              : context.read<ExchangeMoneyBloc>().add(
                    UpdateExchangeMoneyEvent(exchangeMoney: exchangeMoney),
                  );
          Navigator.of(context).pop();
        },
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
