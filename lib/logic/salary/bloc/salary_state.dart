part of 'salary_bloc.dart';

sealed class SalaryState extends Equatable {
  const SalaryState();
  
  @override
  List<Object> get props => [];
}

final class SalaryInitial extends SalaryState {}
