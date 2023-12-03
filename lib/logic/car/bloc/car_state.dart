part of 'car_bloc.dart';

enum CarStatus { initial, success, failure }

class EmployeeState extends Equatable {
  const EmployeeState({
    this.status = CarStatus.initial,
    this.employees = const <EmployeeModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final CarStatus status;
  final List<EmployeeModel> employees;
  final int page;
  final bool hasReachedMax;

  EmployeeState copyWith({
    CarStatus? status,
    List<EmployeeModel>? employees,
    bool? hasReachedMax,
    int? page,
  }) {
    return EmployeeState(
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
