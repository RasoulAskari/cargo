import 'package:flutter/material.dart';

class TransctionItem extends StatelessWidget {
  final Icon icon;
  final String value;
  final String label;
  const TransctionItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          child: icon,
        ),
        Column(
          children: [
            Text(label),
            Text(value),
          ],
        )
      ],
    );
  }
}
