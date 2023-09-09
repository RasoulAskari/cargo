part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SetLoginEvent extends LoginEvent {
  final String email;
  final String password;
  const SetLoginEvent({
    required this.email,
    required this.password,
  });
}

class SetEmailEvent extends LoginEvent {
  final String? email;
  final String? password;
  const SetEmailEvent({this.email, this.password});
}
