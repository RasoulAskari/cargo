import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());
}
