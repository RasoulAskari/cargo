import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'exchange_money_event.dart';
part 'exchange_money_state.dart';

const _postLimit = 10;

class ExchangeMoneyBloc extends Bloc<ExchangeMoneyEvent, ExchangeMoneyState> {
  final http.Client httpClient;

  ExchangeMoneyBloc({required this.httpClient})
      : super(const ExchangeMoneyState()) {
    on<AddExchangeMoneyEvent>(_onAddExchangeMoney);
    on<FetchExchangeMoneyEvent>(_onIncomingOutGoingEvent);
    on<DeleteExchangeMoneyEvent>(_onDeleteExchangeEvent);
    on<UpdateExchangeMoneyEvent>(_onEditExchangeEvent);
  }

  Future<void> _onEditExchangeEvent(UpdateExchangeMoneyEvent event,
      Emitter<ExchangeMoneyState> emitter) async {
    ExchnageMoneyModel exchange = event.exchangeMoney;

    try {
      ExchnageMoneyModel exchangeMoney = event.exchangeMoney;
      final data = {
        "id": exchange.id,
        'phone_number': exchangeMoney.phoneNumber,
        'sender_name': exchangeMoney.senderName,
        'receiver_name': exchangeMoney.receiverName,
        'receiver_father_name': exchangeMoney.receiverFathername,
        'amount': exchangeMoney.amount,
        'currency': exchangeMoney.currency,
        'date': exchangeMoney.date,
        'exchange_id': exchangeMoney.exchnageId,
        'province': exchangeMoney.province,
        'receiver_id_no': exchangeMoney.receiverIdNo,
      };

      final res = await http.put(
        Uri.parse('http://localhost:8000/api/v1/exhange-money'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(data),
      );
      print(res.body);
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> _onDeleteExchangeEvent(DeleteExchangeMoneyEvent event,
      Emitter<ExchangeMoneyState> emitter) async {
    var res = await httpClient.delete(
      getServerRoute(
        route: '/api/v1/exchange-money/${event.id}',
      ),
      headers: <String, String>{
        'Authorization':
            'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
      },
    );

    if (res.body == "true") {
      emitter(
        state.copyWith(
          exchangeMoneys: state.exchangeMoneys
              .where((element) => element.id != event.id)
              .toList(),
        ),
      );
    }
  }

  Future<void> _onAddExchangeMoney(
      AddExchangeMoneyEvent event, Emitter<ExchangeMoneyState> emitter) async {
    ExchnageMoneyModel exchangeMoney = event.exchangeMoney;
    final data = {
      'phone_number': exchangeMoney.phoneNumber,
      'sender_name': exchangeMoney.senderName,
      'receiver_name': exchangeMoney.receiverName,
      'receiver_father_name': exchangeMoney.receiverFathername,
      'amount': exchangeMoney.amount,
      'currency': exchangeMoney.currency,
      'date': exchangeMoney.date,
      'exchange_id': exchangeMoney.exchnageId,
      'province': exchangeMoney.province,
      'receiver_id_no': exchangeMoney.receiverIdNo,
    };

    try {
      final res = await http.post(
        Uri.parse('http://localhost:8000/api/v1/exchange-money'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(data),
      );
      debugPrint(res.body);

      emitter(state.copyWith(
        exchangeMoneys: List.of(state.exchangeMoneys)
          ..insert(0, event.exchangeMoney),
      ));
    } catch (e) {
      debugPrint("${e}dodidi");
      return;
    }
  }

  Future<void> _onIncomingOutGoingEvent(FetchExchangeMoneyEvent event,
      Emitter<ExchangeMoneyState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ExchangeMoneyStatus.initial) {
        final incomingOutGoing = await _fetch_exchange_money(page: state.page);
        return emitter(
          state.copyWith(
            status: ExchangeMoneyStatus.success,
            exchangeMoneys: incomingOutGoing,
            hasReachedMax: incomingOutGoing.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<ExchnageMoneyModel>> _fetch_exchange_money({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/exchange-money',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        return body.map((e) {
          return ExchnageMoneyModel.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
