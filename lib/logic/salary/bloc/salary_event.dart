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
class EditSalaryEvent extends SalaryEvent {
  final SalaryModel salary;

  const EditSalaryEvent({required this.salary});
}

class DeleteSalaryEvent extends SalaryEvent {
  final int id;

  const DeleteSalaryEvent({required this.id});
}
