import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Step2 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step2({super.key, required this.next, required this.prev});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          List<String> role = [];

          state.premissions.value?.forEach((element1) {
            element1.action.forEach((element2) {
              role.add(element2);
            });
          });

          return Container(
            width: 200,
            height: 1000,
            child: GridView.builder(
              itemCount: role.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemBuilder: (context, index) {
                return Text(role[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
