import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exchange_money_event.dart';
part 'exchange_money_state.dart';

class ExchangeMoneyBloc extends Bloc<ExchangeMoneyEvent, ExchangeMoneyState> {
  ExchangeMoneyBloc() : super(ExchangeMoneyInitial()) {
    on<ExchangeMoneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
