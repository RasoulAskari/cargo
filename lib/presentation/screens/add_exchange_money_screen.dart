import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddExchangeMoneyScreen extends StatefulWidget {
  const AddExchangeMoneyScreen({super.key});

  @override
  State<AddExchangeMoneyScreen> createState() => _AddExchangeMoneyScreenState();
}

class _AddExchangeMoneyScreenState extends State<AddExchangeMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Add Exchange money screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
