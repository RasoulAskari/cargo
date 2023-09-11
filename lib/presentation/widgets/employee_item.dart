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
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1391718981/photo/portrait-of-a-confident-young-businessman-standing-with-his-arms-crossed-in-an-office.jpg?s=1024x1024&w=is&k=20&c=cqIGFJ52Gq8D7bkJg3PqbHxOdKVCQIGUVjM6JNzFY7E='),
            ),
            title: Text(
                "${widget.employee.firstName} ${widget.employee.lastName}"),
            subtitle: Text(
                "${widget.employee.email}\n${widget.employee.phoneNumber}"),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [Text("data")],
            ),
          )
        ],
      ),
    );
  }
}
