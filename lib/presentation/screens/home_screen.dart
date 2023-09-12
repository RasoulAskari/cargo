import 'package:cargo/constants/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> data = [
    {
      'name': 'User',
      'image': "",
    },
    {
      'name': 'User',
      'image': "",
    },
    {
      'name': 'User',
      'image': "",
    },
    {
      'name': 'User',
      'image': "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: data.length,
        // Grid layout configuration
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemBuilder: (context, index) {
          
        },
      ),
    );
  }
}
