// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

class UserState extends Equatable {
  final FirstName name;
  final Email email;
  final Password password;
  final CString confirmPassword;
  final CString role;
  final UserList premissions;
  final Privilege privileges;

  const UserState(
      {this.name = const FirstName.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const CString.pure(),
      this.role = const CString.pure(),
      this.premissions = const UserList.pure(),
      this.privileges = const Privilege.pure()});

  @override
  List<Object> get props => [
        name,
        email,
        password,
        confirmPassword,
        role,
        premissions,
        privileges,
      ];

  UserState copyWith({
    FirstName? name,
    Email? email,
    Password? password,
    CString? confirmPassword,
    CString? role,
    UserList? premissions,
    Privilege? privileges,
  }) {
    return UserState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        role: role ?? this.role,
        premissions: premissions ?? this.premissions,
        privileges: privileges ?? this.privileges);
  }
}

final class UserInitial extends UserState {}
