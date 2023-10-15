import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:flutter/material.dart';

class ExchangeMoneyItem extends StatefulWidget {
  final ExchnageMoneyModel exchange;
  const ExchangeMoneyItem({super.key, required this.exchange});

  @override
  State<ExchangeMoneyItem> createState() => _ExchangeMoneyItemState();
}

class _ExchangeMoneyItemState extends State<ExchangeMoneyItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
