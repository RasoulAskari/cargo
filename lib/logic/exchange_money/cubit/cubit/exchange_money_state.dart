// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'exchange_money_cubit.dart';

class ExchangeMoneyState extends Equatable {
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
        province,
      ];

  ExchangeMoneyState copyWith({
    Amount? amount,
    CString? currency,
    MyDate? date,
    CString? exchnageId,
    PhoneNo? phoneNumber,
    CString? receiverIdNo,
    FirstName? receiverName,
    FirstName? receiverFathername,
    FirstName? senderName,
    CString? province,
  }) {
    return ExchangeMoneyState(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      exchnageId: exchnageId ?? this.exchnageId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      receiverIdNo: receiverIdNo ?? this.receiverIdNo,
      receiverName: receiverName ?? this.receiverName,
      receiverFathername: receiverFathername ?? this.receiverFathername,
      senderName: senderName ?? this.senderName,
      province: province ?? this.province,
    );
  }
}

final class ExchangeMoneyInitial extends ExchangeMoneyState {}
