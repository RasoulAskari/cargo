import 'package:cargo/presentation/widgets/c_date_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CDatePicker extends StatefulWidget {
  final String? hintText;
  final Function setValue;
  final DateTime? value;
  const CDatePicker({
    super.key,
    this.hintText,
    required this.setValue,
    this.value,
  });

  @override
  State<CDatePicker> createState() => _CDatePickerState();
}

class _CDatePickerState extends State<CDatePicker> {
  var txt = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    setState(() {
      _selectedDate = widget.value ?? DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txt,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        suffixIcon: Icon(
          Icons.calendar_month,
          color: Colors.grey[600],
          size: 20,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CDatePickerBottomSheet(
            value: _selectedDate,
            setValue: (DateTime value) {
              setState(() {
                _selectedDate = value;
              });
              widget.setValue(_selectedDate);
              txt.text = DateFormat.yMMMMd(
                      Localizations.localeOf(context).toLanguageTag())
                  .format(value);
            },
          ),
        );
      },
    );
  }
}
