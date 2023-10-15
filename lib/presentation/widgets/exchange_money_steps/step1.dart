import 'package:cargo/logic/exchange_money/cubit/cubit/exchange_money_cubit.dart';
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
                hintText: "Sender Name",
                value: state.senderName.value,
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                textInputType: TextInputType.number,
                hintText: "Amount",
                value: state.amount.value.toString(),
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().amountChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
