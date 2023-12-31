import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/user/bloc/user_bloc.dart';
import 'package:cargo/presentation/widgets/user_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                checkPermissionRoute(addUserScreen, 'user_create', context);
              },
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
        title: Text(
          AppLocalizations.of(context)!.employee_screen,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == UserStatus.initial) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return UserItem(user: state.users[index]);
            },
          );
        },
      ),
    );
  }
}
