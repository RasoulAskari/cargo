import 'package:cargo/presentation/widgets/amount.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/incoming_out_going_type.dart';
import 'package:flutter/material.dart';

class AddIncomingOutGoingScreen extends StatefulWidget {
  const AddIncomingOutGoingScreen({super.key});

  @override
  State<AddIncomingOutGoingScreen> createState() =>
      _AddIncomingOutGoingScreenState();
}

class _AddIncomingOutGoingScreenState extends State<AddIncomingOutGoingScreen> {
  DateTime? _date;
  Amount amount = const Amount.pure();
  IncomingOutGoingType incomingOutGoingType = const IncomingOutGoingType.pure();
  _addIncoming() {
    
  }

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
            CDatePicker(
              setValue: (value) {
                setState(() {
                  _date = value;
                });
              },
              hintText: "Register Date",
            ),
            const SizedBox(height: 15),
            CDropdown(
              hintText: "Type",
              setValue: (value) {
                incomingOutGoingType = IncomingOutGoingType.dirty(value);
              },
              items: const [
                {
                  'value': 'incoming',
                  'label': 'Incoming',
                },
                {
                  'value': 'outgoing',
                  'label': 'Outgoing',
                },
              ],
            ),
            const SizedBox(height: 15),
            CTextField(
              textInputType: TextInputType.number,
              hintText: "Amount",
              value: amount.value.toString(),
              setValue: (value) {
                int intValue = int.parse(value);
                amount = Amount.dirty(intValue);
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                _addIncoming();
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
