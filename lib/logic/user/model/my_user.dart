// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String name;
  final String email;
  final String role;
  final String password;
  final String confirmPassword;
  final List<String> permissions;

  const MyUser({
    required this.name,
    required this.email,
    required this.role,
    required this.password,
    required this.confirmPassword,
    required this.permissions,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
        role,
        permissions,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'role': role,
      'password': password,
      'confirmPassword': confirmPassword,
      'permissions': permissions,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      name: map['name'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      permissions: List<String>.from(
        (map['permissions'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) =>
      MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  MyUser copyWith({
    String? name,
    String? email,
    String? role,
    String? password,
    String? confirmPassword,
    List<String>? permissions,
  }) {
    return MyUser(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      permissions: permissions ?? this.permissions,
    );
  }
}
