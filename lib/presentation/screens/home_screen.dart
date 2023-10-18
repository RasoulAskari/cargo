import 'package:cargo/constants/routes.dart';
import 'package:cargo/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  final Function isLogin;
  const HomeScreen({super.key, required this.isLogin});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final List<dynamic> data = [
      {
        'name': 'User',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(userScreen);
        }
      },
      {
        'name': 'Employee',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(employeeScreen);
        }
      },
      {
        'name': 'Incoming  \n Out Going',
        'image': "",
        'function': () async {
          Navigator.of(context).pushNamed(inconingOutGoingScreen);
        }
      },
      {
        'name': 'Orders',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(ordersScreen);
        }
      },
      {
        'name': 'Salary',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(salaryScreen);
        }
      },
      {
        'name': 'Exchange Money',
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(exchangeMoneyScreen);
        }
      },
      {'name': 'Setting', 'image': "", 'function': () {}},
      {
        'name': 'Logout',
        'image': "",
        'function': () async {
          try {
            await _storage
                .delete(key: 'user')
                .then((value) => {widget.isLogin()});
          } catch (e) {
            print(e);
          }
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
