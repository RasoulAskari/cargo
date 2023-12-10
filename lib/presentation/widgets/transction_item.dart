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
          height: 70,
          width: 70,
          child: icon,
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(label),
            SizedBox(height: 20),
            Text(value),
          ],
        )
      ],
    );
  }
}
