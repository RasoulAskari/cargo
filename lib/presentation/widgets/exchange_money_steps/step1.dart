import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/exchange_money/cubit/cubit/exchange_money_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step1 extends StatelessWidget {
  final Function prev;
  final Function next;
  const Step1({super.key, required this.prev, required this.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                hintText: AppLocalizations.of(context)?.sender_name,
                value: state.senderName.value,
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                textInputType: TextInputType.number,
                hintText: AppLocalizations.of(context)?.amount,
                value: state.amount.value.toString(),
                setValue: (value) {
                  double val;
                  if (value == "") {
                    val = 1;
                  } else {
                    val = double.parse(value);
                  }

                  context.read<ExchangeMoneyCubit>().amountChange(val);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CDatePicker(
                value: state.date.value != ""
                    ? DateTime.parse(state.date.value)
                    : DateTime.now(),
                setValue: (value) {
                  context
                      .read<ExchangeMoneyCubit>()
                      .dateChange(value.toString());
                },
                hintText: AppLocalizations.of(context)?.date,
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                hintText: "Exchange ID No",
                value: state.exchangeId.value,
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().exchangeIdChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CDropdown(
                value: state.currency.value,
                hintText: "Type",
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().currencyChange(value);
                },
                items: const [
                  {
                    'value': 'Dollor',
                    'label': 'Dollor',
                  },
                  {
                    'value': 'Afghani',
                    'label': 'Afghani',
                  },
                  {
                    'value': 'Calldor',
                    'label': 'Calldor',
                  },
                ],
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
