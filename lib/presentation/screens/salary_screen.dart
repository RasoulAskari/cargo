import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/salary_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/salary/bloc/salary_bloc.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  checkPermissionRoute(
                      addSalaryScreen, 'salary_create', context);
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
            AppLocalizations.of(context)!.salary_screen,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<SalaryBloc, SalaryState>(
          builder: (context, state) {
            if (state.status == SalaryStatus.initial) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: state.salary.length,
              itemBuilder: (context, index) {
                return SalaryItem(salary: state.salary[index]);
              },
            );
          },
        ));
  }
}
