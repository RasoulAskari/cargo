import 'package:cargo/constants/routes.dart';
import 'package:cargo/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final List<dynamic> data = [
      {'name': 'User', 'image': "", 'function': () {}},
      {
        'name': 'Employee',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(employeeScreen);
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
        'function': () async {
          final data = await _storage.read(key: 'token');
          print(data);
        }
      },
      {'name': 'Setting', 'image': "", 'function': () {}},
      {
        'name': 'Logout',
        'image': "",
        'function': () async {
          final res = await _storage.delete(key: 'token');
          setState(() {});
        }
      },
    ];

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
