part of 'exchange_money_cubit.dart';

sealed class ExchangeMoneyState extends Equatable {
  const ExchangeMoneyState();

  @override
  List<Object> get props => [];
}

final class ExchangeMoneyInitial extends ExchangeMoneyState {}
