// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;
  final String token;
  final String date;
  const LoginModel({
    required this.token,
    required this.date,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'token': token,
      'date': date,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
