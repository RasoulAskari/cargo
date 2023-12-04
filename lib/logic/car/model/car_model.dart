// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  CarModel copyWith({
    int? id,
    int? status,
    double? paymentsSumAmount,
    double? extraExpenseSumPrice,
    double? carExpenseSumPrice,
    double? ordersCount,
    double? totalPrice,
    String? startDate,
    String? endDate,
    double? benefits,
    double? remainder,
  }) {
    return CarModel(
      id: id ?? this.id,
      status: status ?? this.status,
      paymentsSumAmount: paymentsSumAmount ?? this.paymentsSumAmount,
      extraExpenseSumPrice: extraExpenseSumPrice ?? this.extraExpenseSumPrice,
      carExpenseSumPrice: carExpenseSumPrice ?? this.carExpenseSumPrice,
      ordersCount: ordersCount ?? this.ordersCount,
      totalPrice: totalPrice ?? this.totalPrice,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      benefits: benefits ?? this.benefits,
      remainder: remainder ?? this.remainder,
    );
  }
}
