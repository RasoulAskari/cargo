// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String password;
  final String confirmPassword;
  final List<String> permissions;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.password,
    required this.confirmPassword,
    required this.permissions,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        confirmPassword,
        role,
        permissions,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      password: "",
      confirmPassword: "",
      permissions: List<String>.from(
        (map['permissions'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) =>
      MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  MyUser copyWith({
    String? name,
    int? id,
    String? email,
    String? role,
    String? password,
    String? confirmPassword,
    List<String>? permissions,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      permissions: permissions ?? this.permissions,
    );
  }
}
