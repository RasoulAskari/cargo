import 'package:flutter/material.dart';

TableRow cTableCell({required String label, required String title}) {
  return TableRow(
    children: [
      Text(
        label,
      ),
      Text(title)
    ],
  );
}
