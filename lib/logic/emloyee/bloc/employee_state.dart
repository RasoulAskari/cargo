part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  const EmployeeState({
    this.employees = const [],
  });

  final List<EmployeeModel> employees;

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object> get props => [employees];
}
