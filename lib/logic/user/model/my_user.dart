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
  List<Object?> get props => throw UnimplementedError();
}
