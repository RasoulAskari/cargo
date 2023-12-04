import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int id;
  final int status;
  final double paymentsSumAmount;
  final double extraExpenseSumPrice;
  final double carExpenseSumPrice;
  final double ordersCount;
  final double totalPrice;
  final String startDate;
  final String endDate;
  final double benefits;
  final double remainder;

  const CarModel({
    required this.id,
    required this.status,
    required this.paymentsSumAmount,
    required this.extraExpenseSumPrice,
    required this.carExpenseSumPrice,
    required this.ordersCount,
    required this.totalPrice,
    required this.startDate,
    required this.endDate,
    required this.benefits,
    required this.remainder,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
