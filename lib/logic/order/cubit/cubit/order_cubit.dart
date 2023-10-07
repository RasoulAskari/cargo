import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:cargo/presentation/widgets/amount.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:formz/formz.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void groupChange(double value) {
    final group = Amount.dirty(value);
    emit(
      state.copyWith(
        groupNum: group,
      ),
    );
  }

  void cNameChange(String value) {
    final fullname = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: fullname,
      ),
    );
  }

  void cFathernameChange(String value) {
    final cFathername = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerFathername: cFathername,
      ),
    );
  }

  void cGrandFathernameChange(String value) {
    final customerGrandFathername = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerGrandFathername: customerGrandFathername,
      ),
    );
  }

  void cTazkiraIdChange(String value) {
    final customerIdCard = CString.dirty(value);
    emit(
      state.copyWith(customerIdCard: customerIdCard),
    );
  }

  void cPhoneNumberChange(value) {
    final cPhoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(customerPhoneNo: cPhoneNumber),
    );
  }

  void rNameChange(String value) {
    final receiverName = FirstName.dirty(value);
    emit(
      state.copyWith(receiverName: receiverName),
    );
  }

  void rPhoneNumberChange(value) {
    final cPhoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(receiverPhoneNo: cPhoneNumber),
    );
  }

  void countryChange(String value) {
    final country = CString.dirty(value);
    emit(
      state.copyWith(country: country),
    );
  }

  void addressChange(String value) {
    final address = CString.dirty(value);
    emit(
      state.copyWith(address: address),
    );
  }

  void pricePerKeloChange(double value) {
    final pricePerKelo = Amount.dirty(value);
    emit(
      state.copyWith(pricePerKelo: pricePerKelo),
    );
  }

  void dateChange(String value) {
    final date = MyDate.dirty(value);
    emit(
      state.copyWith(date: date),
    );
  }
}
