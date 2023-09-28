import 'package:flutter/material.dart';

class AddIncomingOutGoingScreen extends StatefulWidget {
  const AddIncomingOutGoingScreen({super.key});

  @override
  State<AddIncomingOutGoingScreen> createState() =>
      _AddIncomingOutGoingScreenState();
}

class _AddIncomingOutGoingScreenState extends State<AddIncomingOutGoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Incoming Out Going"),
      ),
    );
  }
}
