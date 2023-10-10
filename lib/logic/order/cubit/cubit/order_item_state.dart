part of 'order_item_cubit.dart';

class OrderItemState extends Equatable {
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

  OrderItemState copyWith({
    CString? name,
    CString? type,
    Number? count,
    Amount? weight,
  }) {
    return OrderItemState(
        count: count ?? this.count,
        name: name ?? this.name,
        weight: weight ?? this.weight,
        type: type ?? this.type);
  }

  @override
  List<Object> get props => [name, type, count, weight];
}

final class OrderItemInitial extends OrderItemState {}
