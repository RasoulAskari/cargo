import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_item_state.dart';

class OrderItemCubit extends Cubit<OrderItemState> {
  OrderItemCubit() : super(OrderItemInitial());
}
