part of 'exchange_money_bloc.dart';

enum ExchangeMoneyStatus { initial, success, failure }

class ExchangeMoneyState extends Equatable {
  const ExchangeMoneyState({
    this.status = ExchangeMoneyStatus.initial,
    this.exchangeMoneys = const <ExchnageMoneyModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final ExchangeMoneyStatus status;
  final List<ExchnageMoneyModel> exchangeMoneys;
  final int page;
  final bool hasReachedMax;

  ExchangeMoneyState copyWith({
    ExchangeMoneyStatus? status,
    List<ExchnageMoneyModel>? exchangeMoneys,
    bool? hasReachedMax,
    int? page,
  }) {
    return ExchangeMoneyState(
      status: status ?? this.status,
      exchangeMoneys: exchangeMoneys ?? this.exchangeMoneys,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''ExchangeMoneyState { status: $status, hasReachedMax: $hasReachedMax, exchangeMoneys: ${exchangeMoneys.length} }''';
  }

  @override
  List<Object> get props => [status, exchangeMoneys, hasReachedMax, page];
}
