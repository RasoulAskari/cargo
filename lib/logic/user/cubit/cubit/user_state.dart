part of 'user_cubit.dart';

class UserState extends Equatable {
  final FirstName name;
  final Email email;
  final CString password;
  final CString confirmPassword;
  final CString role;

  const UserState({
    this.name = const FirstName.pure(),
    this.email = const Email.pure(),
    this.password = const CString.pure(),
    this.confirmPassword = const CString.pure(),
    this.role = const CString.pure(),
  });

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}
