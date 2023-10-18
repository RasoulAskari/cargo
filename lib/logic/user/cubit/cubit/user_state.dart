// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

class UserState extends Equatable {
  final FirstName name;
  final Email email;
  final CString password;
  final CString confirmPassword;
  final CString role;
  final ItemsList premissions;

  const UserState({
    this.name = const FirstName.pure(),
    this.email = const Email.pure(),
    this.password = const CString.pure(),
    this.confirmPassword = const CString.pure(),
    this.role = const CString.pure(),
    this.premissions = const ItemsList.pure(),
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        confirmPassword,
        role,
        premissions,
      ];

  UserState copyWith({
    FirstName? name,
    Email? email,
    CString? password,
    CString? confirmPassword,
    CString? role,
    ItemsList? premissions,
  }) {
    return UserState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      role: role ?? this.role,
      premissions: premissions ?? this.premissions,
    );
  }
}

final class UserInitial extends UserState {}
