import 'package:equatable/equatable.dart';

class ExchnageMoneyModel extends Equatable {
  final int id;
  final double amount;
  final String currency;
  final String date;
  final String exchnageId;
  final String phoneNumber;
  final String receiverIdNo;
  final String receiverName;
  final String receiverFathername;
  final String senderName;

  const ExchnageMoneyModel(
      {required this.id,
      required this.amount,
      required this.currency,
      required this.date,
      required this.exchnageId,
      required this.phoneNumber,
      required this.receiverIdNo,
      required this.receiverName,
      required this.receiverFathername,
      required this.senderName});

  @override
  List<Object?> get props => [];
}
