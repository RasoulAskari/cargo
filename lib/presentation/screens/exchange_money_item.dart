import 'dart:ui';

import 'package:cargo/config/colors.dart';
import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/exchange_money/bloc/bloc/exchange_money_bloc.dart';
import 'package:cargo/logic/exchange_money/model/exchange_money_model.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/table_cell.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExchangeMoneyItem extends StatefulWidget {
  final ExchnageMoneyModel exchange;
  const ExchangeMoneyItem({super.key, required this.exchange});

  @override
  State<ExchangeMoneyItem> createState() => _ExchangeMoneyItemState();
}

class _ExchangeMoneyItemState extends State<ExchangeMoneyItem> {
  @override
  Widget build(BuildContext context) {
    DateTime s = DateTime.parse(widget.exchange.date);
    String date = DateFormat('yMMMMd').format(s);

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                      label: AppLocalizations.of(context)!.sender_name,
                      title: widget.exchange.senderName),
                  cTableCell(
                      label: AppLocalizations.of(context)!.date, title: date),
                  cTableCell(
                      label: AppLocalizations.of(context)!.amount, title: widget.exchange.amount.toString()),
                  cTableCell(
                      label: AppLocalizations.of(context)!.payment_amount,
                      title: widget.salary.payAmount.toString()),
                  cTableCell(
                      label: AppLocalizations.of(context)!.remain_amount,
                      title: widget.salary.remainAmount.toString()),
                ],
              ),
            ),
          ),
        ),
      );
    }

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
                "${widget.exchange.senderName} ${widget.exchange.receiverName}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0Xff303030)),
              ),
            ),
            subtitle: Text(
              widget.exchange.phoneNumber,
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
                        Navigator.of(context).pushNamed(
                          addExchangeMoneyScreen,
                          arguments: widget.exchange,
                        );
                      }, 'exchange_restore', context);
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
                      }, 'exchange_delete', context);
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
                      ),
                    ),
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
                    widget.exchange.date.toString(),
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
                    widget.exchange.amount.toString(),
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
                    .read<ExchangeMoneyBloc>()
                    .add(DeleteExchangeMoneyEvent(id: widget.exchange.id));
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
