import 'package:bloc/bloc.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'exchange_money_event.dart';
part 'exchange_money_state.dart';

const _postLimit = 10;

class ExchangeMoneyBloc extends Bloc<ExchangeMoneyEvent, ExchangeMoneyState> {
  final http.Client httpClient;

  ExchangeMoneyBloc({required this.httpClient})
      : super(const ExchangeMoneyState()) {
    on<AddExchangeMoneyEvent>(_onAddExchangeMoney);
  }

  Future<void> _onAddExchangeMoney(
      AddExchangeMoneyEvent event, Emitter<ExchangeMoneyState> emitter) async {
    ExchnageMoneyModel exchangeMoney = event.exchangeMoney;
    final data = {
      'phone_number': exchangeMoney.phoneNumber,
      'sender_name': exchangeMoney.senderName,
      'reciver_name': exchangeMoney.receiverName,
      'receiver_father_name': exchangeMoney.receiverFathername,
      'amount': exchangeMoney.amount,
      'currency': exchangeMoney.currency,
      'employment_end_date': exchangeMoney.date,
      'exchange_id': exchangeMoney.exchnageId,
      'province': exchangeMoney.province,
      'receiver_id_no': exchangeMoney.receiverIdNo,
    };

    try {
      await httpClient.post(
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        getServerRoute(
          route: '/api/v1/exchangeMoneys',
          params: data,
        ),
      );
      emitter(state.copyWith(
        exchangeMoneys: List.of(state.exchangeMoneys)
          ..insert(0, event.exchangeMoney),
      ));
    } catch (e) {
      return;
    }
  }
}
