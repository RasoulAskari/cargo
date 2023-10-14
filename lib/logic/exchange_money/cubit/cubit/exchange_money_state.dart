part of 'exchange_money_cubit.dart';

sealed class ExchangeMoneyState extends Equatable {
  final Amount amount;
  final CString currency;
  final MyDate date;
  final CString exchnageId;
  final PhoneNo phoneNumber;
  final CString receiverIdNo;
  final FirstName receiverName;
  final FirstName receiverFathername;
  final FirstName senderName;
  final CString province;

  const ExchangeMoneyState({
    required this.amount,
    required this.currency,
    required this.date,
    required this.exchnageId,
    required this.phoneNumber,
    required this.receiverIdNo,
    required this.receiverName,
    required this.receiverFathername,
    required this.senderName,
    required this.province,
  });

  @override
  List<Object> get props => [];
}

final class ExchangeMoneyInitial extends ExchangeMoneyState {}
