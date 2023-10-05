import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step3({super.key, required this.next, required this.prev});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Add Item detail"))
      ],
    );
  }
}
