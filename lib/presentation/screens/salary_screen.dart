import 'package:cargo/constants/routes.dart';
import 'package:cargo/presentation/widgets/salary_item.dart';
import 'package:flutter/material.dart';
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
                  Navigator.of(context).pushNamed(addSalaryScreen);
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
          title: const Text(
            "Salary Screen",
            style: TextStyle(
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
                SalaryItem(salary: state.salary[index]);
              },
            );
          },
        ));
  }
}
