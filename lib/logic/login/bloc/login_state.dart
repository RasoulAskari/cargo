part of 'login_bloc.dart';

enum LoginStatus { initial, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    // ignore: non_constant_identifier_names
    this.user = const <LoginModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final LoginStatus status;
  // ignore: non_constant_identifier_names
  final List<LoginModel> user;
  final int page;
  final bool hasReachedMax;

  LoginState copyWith({
    LoginStatus? status,
    // ignore: non_constant_identifier_names
    List<LoginModel>? user,
    bool? hasReachedMax,
    int? page,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''LoginState { status: $status, hasReachedMax: $hasReachedMax, user: ${user.length} }''';
  }

  @override
  List<Object> get props => [status, user, hasReachedMax, page];
}
