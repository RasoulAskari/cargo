import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(const EmployeeState()) {}
}
