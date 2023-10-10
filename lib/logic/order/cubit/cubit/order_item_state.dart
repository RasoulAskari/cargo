part of 'order_item_cubit.dart';

sealed class OrderItemState extends Equatable {
  final CString name;
  final CString type;
  final Number count;
  final Amount weight;

  const OrderItemState({
    this.name = const CString.pure(),
    this.type = const CString.pure(),
    this.count = const Number.pure(),
    this.weight = const Amount.pure(),
  });

  @override
  List<Object> get props => [name, type, count, weight];
}

final class OrderItemInitial extends OrderItemState {}
