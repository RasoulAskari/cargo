import 'package:flutter/material.dart';

class TransctionItem extends StatelessWidget {
  final Icon icon;
  final String value;
  final String label;
  final Color color;
  const TransctionItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    print(color);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
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
