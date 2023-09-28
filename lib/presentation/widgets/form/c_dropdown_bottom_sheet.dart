import 'package:flutter/material.dart';

class CDropdownBottomSheet extends StatefulWidget {
  final List items;
  final String? value;
  final Function setValue;
  const CDropdownBottomSheet({
    super.key,
    required this.items,
    this.value,
    required this.setValue,
  });

  @override
  State<CDropdownBottomSheet> createState() => _CDropdownBottomSheetState();
}

class _CDropdownBottomSheetState extends State<CDropdownBottomSheet> {
  String? value;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => SizedBox(
        height: 400,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'لطفاً یک گزینه را انتخاب کنید',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 310,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return ListTile(
                        onTap: () {
                          widget.setValue(item['value']);
                          setState(() {
                            value = item['value'];
                          });
                          Navigator.of(context).pop();
                        },
                        leading: Icon(
                          item['value'] == value ? Icons.check_sharp : Icons.location_city_outlined,
                          color: item['value'] == value ? Theme.of(context).colorScheme.primary : null,
                        ),
                        title: Text(
                          item['label'] ?? '',
                          style: TextStyle(
                            color: item['value'] == value ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
