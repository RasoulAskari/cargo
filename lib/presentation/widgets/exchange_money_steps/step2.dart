import 'package:flutter/material.dart';

class Step2 extends StatelessWidget {
  final Function prev;
  final Function next;
  const Step2({super.key, required this.prev, required this.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        children: [
        ],
      ),
    );
  }
}
