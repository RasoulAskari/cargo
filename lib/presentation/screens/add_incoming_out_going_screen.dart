import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:flutter/material.dart';

class AddIncomingOutGoingScreen extends StatefulWidget {
  const AddIncomingOutGoingScreen({super.key});

  @override
  State<AddIncomingOutGoingScreen> createState() =>
      _AddIncomingOutGoingScreenState();
}

class _AddIncomingOutGoingScreenState extends State<AddIncomingOutGoingScreen> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "Add Incoming Out Going",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              CDatePicker(setValue: (value) {
                setState(() {
                  _date = value;
                });
              })
            ],
          ),
        ));
  }
}
