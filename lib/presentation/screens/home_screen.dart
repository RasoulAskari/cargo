import 'package:cargo/constants/routes.dart';
import 'package:cargo/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<dynamic> data = [
    {
      'name': 'User',
      'image': "",
      'function': () {

      }
    },
    {
      'name': 'Employee',
      'image': "",
      'function': () {
        
      }
    },
    {
      'name': 'Orders',
      'image': "",
      'function': () {
        print('how are you');
      }
    },
    {
      'name': 'Exchange',
      'image': "",
      'function': () {
        print('do you know you are my love?');
      }
    },
    {
      'name': 'Setting',
      'image': "",
      'function': () {
        print('do you know you are my love?');
      }
    },
    {
      'name': 'Logout',
      'image': "",
      'function': () {
        print('do you know you are my love?');
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemBuilder: (context, index) {
            return HomeItem(
              name: data[index]['name'],
              function: data[index]['function'],
            );
          },
        ),
      ),
    );
  }
}
