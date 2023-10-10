import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/number.dart';
import 'package:equatable/equatable.dart';

part 'order_item_state.dart';

class OrderItemCubit extends Cubit<OrderItemState> {
  OrderItemCubit() : super(OrderItemInitial());

  void nameChange(String value) {
    final name = CString.dirty(value);
    emit(
      state.copyWith(name: name),
    );
  }

  void typeChange(String value) {
    final type = CString.dirty(value);
    emit(
      state.copyWith(type: type),
    );
  }

  void weightChange(double value) {
    final weight = Amount.dirty(value);
    emit(
      state.copyWith(weight: weight),
    );
  }

  void countChange(int value) {
    final count = Number.dirty(value);
    emit(
      state.copyWith(count: count),
    );
  }

  void resetOrderItem() {
    const name = CString.dirty("");
    const type = CString.dirty("");
    const weight = Amount.dirty(1.0);
    const count = Number.dirty(1);

    emit(
      state.copyWith(
        name: name,
        type: type,
        weight: weight,
        count: count,
      ),
    );
  }
}
