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

  const ExchangeMoneyState(
      {this.amount = const Amount.pure(),
      this.currency = const CString.pure(),
      this.date = const MyDate.pure(),
      this.exchnageId = const CString.pure(),
      this.phoneNumber = const PhoneNo.pure(),
      this.receiverIdNo = const CString.pure(),
      this.receiverName = const FirstName.pure(),
      this.receiverFathername = const FirstName.pure(),
      this.senderName = const FirstName.pure(),
      this.province = const CString.pure()});

  @override
  List<Object> get props => [
        amount,
        currency,
        date,
        exchnageId,
        phoneNumber,
        receiverIdNo,
        receiverName,
        receiverFathername,
        senderName,
        province
      ];
}

final class ExchangeMoneyInitial extends ExchangeMoneyState {}
