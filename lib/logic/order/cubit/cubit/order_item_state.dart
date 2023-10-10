part of 'order_item_cubit.dart';

sealed class OrderItemState extends Equatable {
  final CString name;
  final CString type;
  final Number count;
  final Amount weight;

  const OrderItemState(
      {required this.name,
      required this.type,
      required this.count,
      required this.weight});

  @override
  List<Object> get props => [name, type, count, weight];
}

final class OrderItemInitial extends OrderItemState {}
