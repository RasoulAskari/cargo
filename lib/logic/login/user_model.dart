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
}
