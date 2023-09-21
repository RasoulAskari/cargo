import 'package:flutter/material.dart';

class IncomingOutGoing extends StatefulWidget {
  const IncomingOutGoing({super.key});

  @override
  State<IncomingOutGoing> createState() => _IncomingOutGoingState();
}

class _IncomingOutGoingState extends State<IncomingOutGoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Incoming Out Going",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
