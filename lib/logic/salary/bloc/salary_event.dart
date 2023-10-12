part of 'salary_bloc.dart';

sealed class SalaryEvent extends Equatable {
  const SalaryEvent();

  @override
  List<Object> get props => [];
}

class FetchSalaryEvent extends SalaryEvent {}

class AddSalaryEvent extends SalaryEvent {
  final SalaryModel salary;

  const AddSalaryEvent({required this.salary});
}
