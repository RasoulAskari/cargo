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
            contentPadding: const EdgeInsets.symmetric(),
            leading: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/1391718981/photo/portrait-of-a-confident-young-businessman-standing-with-his-arms-crossed-in-an-office.jpg?s=1024x1024&w=is&k=20&c=cqIGFJ52Gq8D7bkJg3PqbHxOdKVCQIGUVjM6JNzFY7E='))),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                "${widget.employee.firstName} ${widget.employee.lastName}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0Xff303030)),
              ),
            ),
            subtitle: Text(
              "${widget.employee.email}\n${widget.employee.phoneNumber}",
              style: const TextStyle(color: Colors.black54, fontSize: 12),
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
