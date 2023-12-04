// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int id;
  final int status;
  final double? paymentsSumAmount;
  final double? extraExpenseSumPrice;
  final double? carExpenseSumPrice;
  final double? ordersCount;
  final double? totalPrice;
  final String? startDate;
  final String? endDate;
  final double? benefits;
  final double? remainder;

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'paymentsSumAmount': paymentsSumAmount,
      'extraExpenseSumPrice': extraExpenseSumPrice,
      'carExpenseSumPrice': carExpenseSumPrice,
      'ordersCount': ordersCount,
      'totalPrice': totalPrice,
      'startDate': startDate,
      'endDate': endDate,
      'benefits': benefits,
      'remainder': remainder,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as int,
      status: map['status'] as int,
      paymentsSumAmount:
          double.tryParse(map['payments_sum_amount'] ?? 0.0) as double,
      extraExpenseSumPrice:
          double.tryParse(map['extra_expense_sum_price'] ?? 0.0) as double,
      carExpenseSumPrice:
          double.tryParse(map['car_expense_sum_price'] ?? 0.0) as double,
      ordersCount: double.tryParse(map['orders_count'] ?? 0.0) as double,
      totalPrice: double.tryParse(map['total_price'] ?? 0.0) as double,
      startDate: map['start_date'] as String,
      endDate: map['end_date'] as String,
      benefits: map['benefits'] as double,
      remainder: map['remainder'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
