import 'dart:ui';

import 'package:cargo/config/colors.dart';
import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/table_cell.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EmployeeItem extends StatefulWidget {
  final EmployeeModel employee;
  const EmployeeItem({super.key, required this.employee});

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  Widget build(BuildContext context) {
    DateTime s = DateTime.parse(widget.employee.startDate);
    String startDate = DateFormat('yMMMMd').format(s);

    DateTime d = DateTime.parse(widget.employee.endDate);
    String endDate = DateFormat('yMMMMd').format(d);

    showDetail() {
      showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        builder: (_) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 440),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Palette.kToGrey,
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Table(
                  defaultColumnWidth:
                      const FlexColumnWidth(), // Use flexible width for columns

                  columnWidths: {
                    0: FixedColumnWidth(
                      MediaQuery.of(context).size.width / 10 * 2,
                    ), // Set width for the first column
                    1: FlexColumnWidth(
                      MediaQuery.of(context).size.width / 10 * 8,
                    ), // Let the second column take flexible width
                  },
                  children: [
                    cTableCell(
                        label: AppLocalizations.of(context)!.firstname,
                        title: widget.employee.firstName),
                    cTableCell(
                        label: AppLocalizations.of(context)!.lastname,
                        title: widget.employee.lastName),
                    cTableCell(
                        label: AppLocalizations.of(context)!.email,
                        title: widget.employee.email),
                    cTableCell(
                        label: AppLocalizations.of(context)!.phone_num,
                        title: widget.employee.phoneNumber),
                    cTableCell(
                        label: AppLocalizations.of(context)!.current_address,
                        title: widget.employee.currentAddress),
                    cTableCell(
                        label: AppLocalizations.of(context)!.premenent_address,
                        title: widget.employee.permenentAddress),
                    cTableCell(
                        label: AppLocalizations.of(context)!.start_date,
                        title: startDate),
                    cTableCell(
                        label: AppLocalizations.of(context)!.end_date,
                        title: endDate),
                    cTableCell(
                        label: AppLocalizations.of(context)!.job_title,
                        title: widget.employee.jobTitle),
                    cTableCell(
                        label: AppLocalizations.of(context)!.salary,
                        title: widget.employee.salary.toString()),
                  ],
                )),
          ),
        ),
      );
    }

    return Column(
      children: [
        InkWell(
          onTap: () {
            showDetail();
          },
          child: Container(
            padding: const EdgeInsets.only(right: 15),
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
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black12,
                    width: 3.0,
                  ),
                ),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d'))),
                ),
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
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              trailing: SizedBox(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        checkPermissionAction(() {
                          Navigator.of(context).pushNamed(addEmployee,
                              arguments: widget.employee);
                        }, "employee_restore", context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color(0x55ff711b),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.edit_document,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                    const SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {
                        checkPermissionAction(() {
                          onDelete();
                        }, 'employee_delete', context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color(0x55ff711b),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.delete_forever,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ],
                ),
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.calendar_month_outlined),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    startDate,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.calendar_month_outlined)),
                  const SizedBox(width: 10),
                  Text(
                    endDate,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  onDelete() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: const Text(
            "Are You Sure You Want to Delete This?",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Theme.of(context).primaryColor),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                context
                    .read<EmployeeBloc>()
                    .add(DeleteEmployeeEvent(id: widget.employee.id));
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
