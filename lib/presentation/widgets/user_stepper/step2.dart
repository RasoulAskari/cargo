import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/logic/user/model/user_privileges.dart';
import 'package:cargo/presentation/widgets/form/check_box.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step2 extends StatefulWidget {
  final Function next;
  final Function prev;

  const Step2({super.key, required this.next, required this.prev});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  List<Map<String, dynamic>> dataItem = [];

  void addItem(Map<String, dynamic> item) {
    if (item['check']) {
      dataItem.add(item);
    } else {
      dataItem.remove(
        dataItem.firstWhere(
          (element) => element['data'] == item['data'],
        ),
      );
    }

    context.read<UserCubit>().privilegeChange(
          UserPrivileage(
            allowRole: dataItem.map((e) => e['data'].toString()).toList(),
          ),
        );
  }

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
            height: MediaQuery.of(context).size.height / 7 * 5,
            child: ListView(children: <Widget>[
              Wrap(
                  children: role.map((e) {
                var data = e.toString().replaceAll("_", " ");

                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: ActionCheckBox(
                    updateData:
                        context.read<UserCubit>().state.privileges.value == null
                            ? []
                            : context
                                .read<UserCubit>()
                                .state
                                .privileges
                                .value!
                                .allowRole,
                    data: e,
                    value: data[0].toUpperCase() + data.substring(1),
                    setValue: (value) {
                      addItem(value);
                    },
                  ),
                );
              }).toList())
            ]),
          );
        },
      ),
    );
  }
}
