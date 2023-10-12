// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:cargo/logic/emloyee/model/employee_model.dart';

class SalaryModel extends Equatable {
  final EmployeeModel employee;
  final double salaryAmount;
  final String date;
  final double payAmount;
  final double remainAmount;

  const SalaryModel({
    required this.employee,
    required this.salaryAmount,
    required this.date,
    required this.payAmount,
    required this.remainAmount,
  });

  @override
  List<Object?> get props => [
        employee,
        salaryAmount,
        date,
        payAmount,
        remainAmount,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employee': employee.toMap(),
      'salaryAmount': salaryAmount,
      'date': date,
      'payAmount': payAmount,
      'remainAmount': remainAmount,
    };
  }

  factory SalaryModel.fromMap(Map<String, dynamic> map) {
    return SalaryModel(
      employee: EmployeeModel.fromMap(map['employee'] as Map<String, dynamic>),
      salaryAmount: map['salaryAmount'] as double,
      date: map['date'] as String,
      payAmount: map['payAmount'] as double,
      remainAmount: map['remainAmount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalaryModel.fromJson(String source) =>
      SalaryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
