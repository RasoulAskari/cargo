import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int id;
  final int status;
  final double payments_sum_amount;
  final double extra_expense_sum_price;
  final double car_expense_sum_price;
  final double orders_count;
  final double total_price;
  final String start_date;
  final String end_date;
  final double benefits;
  final double remainder;

  const CarModel(
      {required this.id,
      required this.status,
      required this.payments_sum_amount,
      required this.extra_expense_sum_price,
      required this.car_expense_sum_price,
      required this.orders_count,
      required this.total_price,
      required this.start_date,
      required this.end_date,
      required this.benefits,
      required this.remainder});

  @override
  List<Object?> get props => throw UnimplementedError();
}
