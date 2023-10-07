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

  void cNameChange(String value) {
    final fullname = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: fullname,
      ),
    );
  }

  void cFathernameChange(String value) {
    final fullname = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: fullname,
      ),
    );
  }

  void cGrandFathernameChange(String value) {
    final fullname = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: fullname,
      ),
    );
  }



}
