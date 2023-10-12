import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:equatable/equatable.dart';

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
}
