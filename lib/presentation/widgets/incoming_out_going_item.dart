import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/incoming_out_going/bloc/bloc/incoming_out_going_bloc.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomingOutGoingItem extends StatefulWidget {
  const IncomingOutGoingItem({super.key, required this.item});
  final IncomingOutGoing item;

  @override
  State<IncomingOutGoingItem> createState() => _IncomingOutGoingItemState();
}

class _IncomingOutGoingItemState extends State<IncomingOutGoingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15),
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
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
                        'https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d'),
                  ),
                ),
              ),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.item.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0Xff303030)),
              ),
            ),
            subtitle: Text(
              widget.item.type,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
            trailing: SizedBox(
              width: 110,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      checkPermissionAction(() {
                        Navigator.of(context).pushNamed(addIncomingOutGoing,
                            arguments: widget.item);
                      }, "income_restore", context);
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
                      }, 'income_delete', context);
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
                    widget.item.amount.toString(),
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
                    widget.item.createdBy.name,
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
                    .read<IncomingOutGoingBloc>()
                    .add(DeleteIncomingOutGoingEvent(id: widget.item.id));
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
