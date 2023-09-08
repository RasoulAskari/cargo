part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SetEmailEvent extends LoginEvent {
  final String? email;
  final String? password;
  SetEmailEvent({this.email, this.password});
}
