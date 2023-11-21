import 'package:flutter/material.dart';

TableRow cTableCell({required String label, required String title}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          label,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(title),
      )
    ],
  );
}
