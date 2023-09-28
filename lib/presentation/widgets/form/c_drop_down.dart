import 'package:flutter/material.dart';
import 'package:raavi/presentation/widgets/form/c_dropdown_bottom_sheet.dart';

class CDropdown extends StatefulWidget {
  final String? value;
  final Function setValue;
  final String? hintText;
  final List items;
  const CDropdown({
    super.key,
    this.value,
    required this.setValue,
    required this.items,
    this.hintText,
  });

  @override
  State<CDropdown> createState() => _CDropdownState();
}

class _CDropdownState extends State<CDropdown> {
  var txt = TextEditingController();
  @override
  void initState() {
    super.initState();
    var selected = widget.items.where((element) {
      return element['value'] == widget.value;
    });
    List items = selected.toList();
    if (items.isNotEmpty) {
      txt.text = items[0]['label'];
    }
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
          Icons.arrow_drop_down,
          color: Colors.grey[600],
          size: 30,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CDropdownBottomSheet(
            items: widget.items,
            value: widget.value,
            setValue: (String? value) {
              widget.setValue(value);
              var found =
                  widget.items.where((item) => item['value'] == value).first;
              txt.text = found['label'];
            },
          ),
        );
      },
      onChanged: (value) {
        widget.setValue(value);
      },
    );
  }
}
