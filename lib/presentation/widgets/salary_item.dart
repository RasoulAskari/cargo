import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:flutter/material.dart';

class SalaryItem extends StatefulWidget {
  final SalaryModel salary;
  const SalaryItem({super.key, required this.salary});

  @override
  State<SalaryItem> createState() => _SalaryItemState();
}

class _SalaryItemState extends State<SalaryItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
