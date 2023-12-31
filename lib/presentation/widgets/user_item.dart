import 'dart:ui';

import 'package:cargo/config/colors.dart';
import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/user/bloc/user_bloc.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:cargo/presentation/widgets/table_cell.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItem extends StatelessWidget {
  final MyUser user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                        label: AppLocalizations.of(context)!.item_name,
                        title: user.name),
                    cTableCell(
                        label: AppLocalizations.of(context)!.email,
                        title: user.email),
                    cTableCell(
                        label: AppLocalizations.of(context)!.email,
                        title: user.role),
                    cTableCell(
                        label: AppLocalizations.of(context)!.permissions,
                        title: user.permissions.toString()),
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
                    color: Colors.black12, // Border color
                    width: 3.0, // Border width
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
                  "${user.name} ",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0Xff303030)),
                ),
              ),
              subtitle: Text(
                user.email,
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
                          Navigator.of(context)
                              .pushNamed(addUserScreen, arguments: user);
                        }, 'user_restore', context);
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
                          onDelete(context);
                        }, 'user_delete', context);
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
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: user.permissions.map((e) {
              var data = e.toString().replaceAll("_", " ");

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color(0x55ff711b),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  data[0].toUpperCase() + data.substring(1),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }).toList()),
          ),
        )
      ],
    );
  }

  onDelete(context) {
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
                context.read<UserBloc>().add(DeleteUserEvent(id: user.id));
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
