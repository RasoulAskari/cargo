// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:cargo/logic/login/user_model.dart';

class IncomingOutGoing extends Equatable {
  final String name;
  final String type;
  final double amount;
  final UserModel user;

  IncomingOutGoing(this.name, this.type, this.amount, this.user);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'amount': amount,
      'user': user.toMap(),
    };
  }

  factory IncomingOutGoing.fromMap(Map<String, dynamic> map) {
    return IncomingOutGoing(
      map['name'] as String,
      map['type'] as String,
      map['amount'] as double,
      UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomingOutGoing.fromJson(String source) =>
      IncomingOutGoing.fromMap(json.decode(source) as Map<String, dynamic>);
}
