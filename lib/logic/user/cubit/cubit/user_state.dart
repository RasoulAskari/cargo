part of 'user_cubit.dart';

class UserState extends Equatable {
  final FirstName name;
  final Email email;
  final CString password;
  final CString confirmPassword;
  final CString role;

  const UserState({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.role,
  });

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}
