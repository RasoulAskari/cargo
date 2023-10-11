part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchOrderEvent extends OrderEvent {}

class AddOrderEvent extends OrderEvent {
  final OrderModel order;

  const AddOrderEvent({required this.order});
}

class DeleteOrderEvent extends OrderEvent {
  final int id;

  const DeleteOrderEvent({required this.id});
}

class FetchCurrentCar extends OrderEvent {}
