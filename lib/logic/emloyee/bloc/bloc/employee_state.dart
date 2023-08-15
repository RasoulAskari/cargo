part of 'employee_bloc.dart';

sealed class EmployeeState extends Equatable {
  const EmployeeState();
  
  @override
  List<Object> get props => [];
}

final class EmployeeInitial extends EmployeeState {}
