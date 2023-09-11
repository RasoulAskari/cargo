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
    return Column(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1391718981/photo/portrait-of-a-confident-young-businessman-standing-with-his-arms-crossed-in-an-office.jpg?s=1024x1024&w=is&k=20&c=cqIGFJ52Gq8D7bkJg3PqbHxOdKVCQIGUVjM6JNzFY7E='),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                  "${widget.employee.firstName} ${widget.employee.lastName}"),
            ),
            subtitle: Text(
              "${widget.employee.email}\n${widget.employee.phoneNumber}",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(),
        )
      ],
    );
  }
}
