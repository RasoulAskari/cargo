import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
