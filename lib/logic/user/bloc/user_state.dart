part of 'user_bloc.dart';

enum EmployeeStatus { initial, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = EmployeeStatus.initial,
    this.employees = const <RoleModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final EmployeeStatus status;
  final List<RoleModel> employees;
  final int page;
  final bool hasReachedMax;

  UserState copyWith({
    EmployeeStatus? status,
    List<RoleModel>? employees,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''employeestate { status: $status, hasReachedMax: $hasReachedMax, employees: ${employees.length} }''';
  }

  @override
  List<Object> get props => [status, employees, hasReachedMax, page];
}
