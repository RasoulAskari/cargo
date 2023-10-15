import 'package:bloc/bloc.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:equatable/equatable.dart';

part 'exchange_money_event.dart';
part 'exchange_money_state.dart';

class ExchangeMoneyBloc extends Bloc<ExchangeMoneyEvent, ExchangeMoneyState> {
  ExchangeMoneyBloc() : super(const ExchangeMoneyState()) {}
}
