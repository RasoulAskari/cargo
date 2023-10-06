part of 'order_bloc.dart';

enum OrderStatus { initial, success, failure }

class OrderState extends Equatable {
  const OrderState({
    this.status = OrderStatus.initial,
    this.orders = const <OrderModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final OrderStatus status;
  final List<OrderModel> orders;
  final int page;
  final bool hasReachedMax;

  OrderState copyWith({
    OrderStatus? status,
    List<OrderModel>? orders,
    bool? hasReachedMax,
    int? page,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''OrderState { status: $status, hasReachedMax: $hasReachedMax, orders: ${orders.length} }''';
  }

  @override
  List<Object> get props => [status, orders, hasReachedMax, page];
}
