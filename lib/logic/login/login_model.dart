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
}
