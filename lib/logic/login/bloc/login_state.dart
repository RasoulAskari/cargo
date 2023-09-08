part of 'login_bloc.dart';

enum EmployeeStatus { initial, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = EmployeeStatus.initial,
    this.hasReachedMax = false,
    this.page = 0,
  });

  final EmployeeStatus status;
  final int page;
  final bool hasReachedMax;

  LoginState copyWith({
    EmployeeStatus? status,
    List<LoginModel>? employees,
    bool? hasReachedMax,
    int? page,
  }) {
    return LoginState(
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''login state { status: $status, hasReachedMax: $hasReachedMax,  }''';
  }

  @override
  List<Object> get props => [status, hasReachedMax, page];
}
