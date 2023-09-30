// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:cargo/logic/login/user_model.dart';

class IncomingOutGoing extends Equatable {
  final String name;
  final String type;
  final double amount;
  final UserModel createdBy;

  const IncomingOutGoing({
    required this.name,
    required this.type,
    required this.amount,
    required this.createdBy,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, type, amount, createdBy];



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'amount': amount,
      'createdBy': createdBy.toMap(),
    };
  }

  factory IncomingOutGoing.fromMap(Map<String, dynamic> map) {
    return IncomingOutGoing(
      name: map['name'] as String,
      type: map['type'] as String,
      amount: double.parse(map['amount'].toString()),
      createdBy: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomingOutGoing.fromJson(String source) => IncomingOutGoing.fromMap(json.decode(source) as Map<String, dynamic>);
}
