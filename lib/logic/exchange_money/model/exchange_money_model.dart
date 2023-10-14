// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  final String province;

  const ExchnageMoneyModel({
    required this.id,
    required this.province,
    required this.amount,
    required this.currency,
    required this.date,
    required this.exchnageId,
    required this.phoneNumber,
    required this.receiverIdNo,
    required this.receiverName,
    required this.receiverFathername,
    required this.senderName,
  });

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
      province: province ?? this.province,
      date: date ?? this.date,
      exchnageId: exchnageId ?? this.exchnageId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      receiverIdNo: receiverIdNo ?? this.receiverIdNo,
      receiverName: receiverName ?? this.receiverName,
      receiverFathername: receiverFathername ?? this.receiverFathername,
      senderName: senderName ?? this.senderName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'currency': currency,
      'date': date,
      'exchnageId': exchnageId,
      'phoneNumber': phoneNumber,
      'receiverIdNo': receiverIdNo,
      'receiverName': receiverName,
      'receiverFathername': receiverFathername,
      'senderName': senderName,
    };
  }

  factory ExchnageMoneyModel.fromMap(Map<String, dynamic> map) {
    return ExchnageMoneyModel(
      id: map['id'] as int,
      amount: map['amount'] as double,
      currency: map['currency'] as String,
      province: map['province'] as String,
      date: map['date'] as String,
      exchnageId: map['exchnage_id'] as String,
      phoneNumber: map['phone_number'] as String,
      receiverIdNo: map['receiver_id_no'] as String,
      receiverName: map['receiver_name'] as String,
      receiverFathername: map['receiver_fathername'] as String,
      senderName: map['sender_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchnageMoneyModel.fromJson(String source) =>
      ExchnageMoneyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
