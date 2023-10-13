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
  final int id;

  const SalaryModel({
    required this.id,
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
      id: map['id'] as int,
      employee: EmployeeModel(
          id: map['employee']['id'],
          currentAddress: "currentAddress",
          permenentAddress: "permenentAddress",
          startDate: 'startDate',
          endDate: 'endDate',
          jobTitle: map['employee']['job_title'],
          salary: double.parse(map['employee']['salary'].toString()),
          firstName: map['employee']['first_name'],
          lastName: map['employee']['last_name'],
          profile: "profile",
          email: "email",
          phoneNumber: "phoneNumber"),
      salaryAmount: double.parse(map['salary'].toString()),
      date: map['created_at'] as String,
      payAmount: double.parse(map['paid'].toString()),
      remainAmount:
          map['remainAmount'] == null ? 0 : map['remainAmount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalaryModel.fromJson(String source) =>
      SalaryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SalaryModel copyWith(
      {EmployeeModel? employee,
      double? salaryAmount,
      String? date,
      double? payAmount,
      double? remainAmount,
      int? id}) {
    return SalaryModel(
      id: id ?? this.id,
      employee: employee ?? this.employee,
      salaryAmount: salaryAmount ?? this.salaryAmount,
      date: date ?? this.date,
      payAmount: payAmount ?? this.payAmount,
      remainAmount: remainAmount ?? this.remainAmount,
    );
  }
}
