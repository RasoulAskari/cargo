import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:cargo/presentation/widgets/amount.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/form_models/first_name.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void cNameChange(String value) {
    final cName = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: cName,
      ),
    );
  }
}
