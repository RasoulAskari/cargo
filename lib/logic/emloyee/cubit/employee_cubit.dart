import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/address.dart';
import 'package:cargo/logic/form_models/amount.dart';
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
      firstname: sName,
    ));
  }

  void lastnameChange(String value) {
    final sName = FirstName.dirty(value);
    emit(state.copyWith(
      lastname: sName,
    ));
  }

  void phoneNumberChange(value) {
    final phoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(phoneNo: phoneNumber),
    );
  }

  void emailChange(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
    ));
  }

  void currentAddressChange(String value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(currentAddress: address),
    );
  }

  void premenentAddressChange(String value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(premenentAddress: address),
    );
  }

  void startDateChange(String value) {
    final date = MyDate.dirty(value);
    emit(state.copyWith(
      startDate: date,
    ));
  }

  void endDateChange(String value) {
    final date = MyDate.dirty(value);
    emit(state.copyWith(
      endDate: date,
    ));
  }

  void salaryChange(double value) {
    final salary = Amount.dirty(value);
    emit(state.copyWith(
      salary: salary,
    ));
  }

  void sibmit() {
    emit(state.copyWith(
      firstname: const FirstName.pure(),
      lastname: const FirstName.pure(),
      phoneNo: const PhoneNo.pure(),
      email: const Email.pure(),
      currentAddress: const Address.pure(),
      premenentAddress: const Address.pure(),
      startDate: const MyDate.pure(),
      endDate: const MyDate.pure(),
      salary: const Amount.pure(),
    ));
  }
}
