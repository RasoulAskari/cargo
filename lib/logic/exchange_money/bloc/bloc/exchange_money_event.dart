part of 'exchange_money_bloc.dart';

sealed class ExchangeMoneyEvent extends Equatable {
  const ExchangeMoneyEvent();

  @override
  List<Object> get props => [];
}

class AddExchangeMoneyEvent extends ExchangeMoneyEvent {
  final ExchnageMoneyModel exchangeMoney;

  const AddExchangeMoneyEvent({required this.exchangeMoney});
}

class UpdateExchangeMoneyEvent extends ExchangeMoneyEvent {
  final ExchnageMoneyModel exchangeMoney;

  const UpdateExchangeMoneyEvent({required this.exchangeMoney});
}


class FetchExchangeMoneyEvent extends ExchangeMoneyEvent {}

class DeleteExchangeMoneyEvent extends ExchangeMoneyEvent {
  final int id;

  const DeleteExchangeMoneyEvent({required this.id});
}
