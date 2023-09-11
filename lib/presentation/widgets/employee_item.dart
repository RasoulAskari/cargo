import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeItem extends StatefulWidget {
  final EmployeeModel employee;
  const EmployeeItem({super.key, required this.employee});

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text("${widget.employee.firstName} ${widget.employee.lastName}"),
        subtitle:
            Text("${widget.employee.email}\n${widget.employee.phoneNumber}"),
      ),
    );
  }
}
