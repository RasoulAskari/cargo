import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:cargo/presentation/widgets/amount.dart';
import 'package:cargo/utils/phone_number.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:formz/formz.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

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
}
