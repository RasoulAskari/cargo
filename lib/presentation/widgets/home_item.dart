import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.name});
  final String name;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Expanded(
            child: Container(
          child: Center(
              child: Text(
            widget.name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
        )),
      ),
    );
  }
}
