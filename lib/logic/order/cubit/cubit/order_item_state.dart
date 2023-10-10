part of 'order_item_cubit.dart';

sealed class OrderItemState extends Equatable {

  const OrderItemState();

  @override
  List<Object> get props => [];
}

final class OrderItemInitial extends OrderItemState {}
