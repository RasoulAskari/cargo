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
}
