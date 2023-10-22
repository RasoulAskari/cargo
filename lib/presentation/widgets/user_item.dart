import 'package:cargo/logic/user/bloc/user_bloc.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItem extends StatelessWidget {
  final MyUser user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      // Navigator.of(context)
                      //     .pushNamed(addEmployee, arguments: widget.employee);
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
                      onDelete(context);
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

  onDelete(context) async {
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
