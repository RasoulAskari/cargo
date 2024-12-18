import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/emloyee/bloc/employee_bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/employee_item.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 250,
            height: 40,
            child: CTextField(
              hintText: "Search...",
              value: '',
              setValue: (value) {
                
              },
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 60,
            height: 40,
            child: CDropdown(
              items: const [
                {'label': "Name", 'value': "name"},
                {'label': "ID", 'value': "id"}
              ],
              setValue: (value) {
                print(value);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              checkPermissionRoute(addEmployee, 'employee_view', context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
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
        // title: Text(
        //   AppLocalizations.of(context)!.employee_screen,
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state.status == EmployeeStatus.initial) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                return EmployeeItem(
                  employee: state.employees[index],
                );
              });
        },
      ),
    );
  }
}
