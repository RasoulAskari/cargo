part of 'employee_bloc.dart';

sealed class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeesFetched extends EmployeeEvent {}

class AddEmployeeEvent extends EmployeeEvent {
  final EmployeeModel employee;

  AddEmployeeEvent({required this.employee});
}
