import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Cargo", home: CargoHome());
  }
}

class CargoHome extends StatefulWidget {
  const CargoHome({super.key});

  @override
  State<CargoHome> createState() => _CargoHomeState();
}

class _CargoHomeState extends State<CargoHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
