import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/address.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/my_date.dart';
import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:equatable/equatable.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  void firstnameChange(String value) {
    final sName = FirstName.dirty(value);
    emit(state.copyWith(
      firstname : sName,
    ));
  }
}
