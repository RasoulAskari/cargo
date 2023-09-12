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
    return GridTile(child: Text(widget.name));
  }
}
