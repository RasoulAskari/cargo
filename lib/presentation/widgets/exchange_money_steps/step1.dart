import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  final Function prev;
  final Function next;
  const Step1({super.key, required this.prev, required this.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
