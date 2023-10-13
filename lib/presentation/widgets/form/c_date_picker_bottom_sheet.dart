import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:scroll_date_picker/scroll_date_picker.dart';

class CDatePickerBottomSheet extends StatefulWidget {
  final Function setValue;
  final DateTime? value;
  const CDatePickerBottomSheet({
    super.key,
    required this.setValue,
    required this.value,
  });

  @override
  State<CDatePickerBottomSheet> createState() => _CDatePickerBottomSheetState();
}

class _CDatePickerBottomSheetState extends State<CDatePickerBottomSheet> {
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    setState(() {
      _selectedDate = widget.value ?? DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => SizedBox(
        height: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: const Text(
                    'لطفا تاریخی را انتخاب کنید',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 240,
              child: ScrollDatePicker(
                options: const DatePickerOptions(isLoop: false),
                selectedDate: _selectedDate,
                locale: Localizations.localeOf(context),
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      widget.setValue(
                        _selectedDate,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "confirm",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
