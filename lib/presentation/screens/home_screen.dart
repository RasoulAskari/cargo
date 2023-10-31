import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cargo/config/localization.dart';
import 'package:toast/toast.dart';

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
        'name': AppLocalizations.of(context)!.user,
        'image': "",
        'function': () async {
          final res = await checkUserPermission('order_create');
          // ignore: use_build_context_synchronously
          res
              ? Navigator.of(context).pushNamed(userScreen)
              : Toast.show("Access Deny");
        }
      },
      {
        'name': AppLocalizations.of(context)?.employee,
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(employeeScreen);
        }
      },
      {
        'name': AppLocalizations.of(context)?.incoming_outgoing,
        'image': "",
        'function': () async {
          Navigator.of(context).pushNamed(inconingOutGoingScreen);
        }
      },
      {
        'name': AppLocalizations.of(context)?.order,
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(ordersScreen);
        }
      },
      {
        'name': AppLocalizations.of(context)?.salary,
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(salaryScreen);
        }
      },
      {
        'name': AppLocalizations.of(context)?.exchange_money,
        'image': "",
        'function': () {
          Navigator.of(context).pushNamed(exchangeMoneyScreen);
        }
      },
      {
        'name': AppLocalizations.of(context)?.setting,
        'image': "",
        'function': () {},
      },
      {
        'name': AppLocalizations.of(context)?.logout,
        'image': "",
        'function': () async {
          try {
            await _storage
                .delete(key: 'user')
                .then((value) => {widget.isLogin()});
          } catch (e) {
            return;
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
