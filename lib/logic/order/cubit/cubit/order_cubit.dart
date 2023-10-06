import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/full_name.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/form_models/first_name.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
}
