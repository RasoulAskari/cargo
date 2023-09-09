// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String role;
  final String permission;
  final String token;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.permission,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? role,
    String? permission,
    String? token,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      permission: permission ?? this.permission,
      token: token ?? this.token,
    );
  }
}
