import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/presentation/widgets/form/check_box.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          List<String> role = [];

          state.premissions.value?.forEach((element1) {
            for (var element2 in element1.action) {
              role.add(element2);
            }
          });

          return SizedBox(
              width: 5540,
              height: 900,
              child: Wrap(
                  children: role
                      .map((e) => ActionCheckBox(value: e, setValue: () {}))
                      .toList())
              // GridView.builder(
              //   itemCount: role.length,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2, // Number of columns
              //     crossAxisSpacing: 0, // Spacing between columns
              //     mainAxisSpacing: 0, // Spacing between rows
              //   ),
              //   itemBuilder: (context, index) {
              //     var data = role[index].toString().replaceAll("_", " ");
              //     return ActionCheckBox(
              //         value: data[0].toUpperCase() + data.substring(1),
              //         setValue: (value) {});
              //   },
              // ),
              );
        },
      ),
    );
  }
}
