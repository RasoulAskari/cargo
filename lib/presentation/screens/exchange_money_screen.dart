import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/exchange_money/bloc/bloc/exchange_money_bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/screens/exchange_money_item.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ExchangeMoneyScreen extends StatelessWidget {
  const ExchangeMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                checkPermissionRoute(
                    addExchangeMoneyScreen, 'exchange_create', context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.exchange_money_screen,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<ExchangeMoneyBloc, ExchangeMoneyState>(
        builder: (context, state) {
          if (state.status == ExchangeMoneyStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.exchangeMoneys.length,
            itemBuilder: (context, index) {
              return ExchangeMoneyItem(exchange: state.exchangeMoneys[index]);
            },
          );
        },
      ),
    );
  }
}
