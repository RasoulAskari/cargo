// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  ExchnageMoneyModel copyWith({
    int? id,
    double? amount,
    String? currency,
    String? date,
    String? exchnageId,
    String? phoneNumber,
    String? receiverIdNo,
    String? receiverName,
    String? receiverFathername,
    String? senderName,
  }) {
    return ExchnageMoneyModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      exchnageId: exchnageId ?? this.exchnageId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      receiverIdNo: receiverIdNo ?? this.receiverIdNo,
      receiverName: receiverName ?? this.receiverName,
      receiverFathername: receiverFathername ?? this.receiverFathername,
      senderName: senderName ?? this.senderName,
    );
  }
}
