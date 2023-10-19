import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/logic/user/model/role_model.dart';
import 'package:cargo/presentation/widgets/form/c_drop_down.dart';
import 'package:cargo/presentation/widgets/form/c_password_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Step1 extends StatelessWidget {
  final Function next;
  final Function prev;

  Step1({super.key, required this.next, required this.prev});
  List<RoleModel> systemList = [
    const RoleModel(
      systemId: "users",
      systemName: "Users",
      action: [
        'user_view',
        'user_create',
        'user_delete',
        'user_restore',
        'user_force_delete'
      ],
      allowRole: ['admin'],
    ),
    const RoleModel(systemId: 'employees', systemName: 'کارمندان', action: [
      'employee_view',
      'employee_create',
      'employee_delete',
      'employee_restore',
      'employee_force_delete'
    ], allowRole: [
      'admin'
    ]),
    const RoleModel(
      systemId: 'salaries',
      systemName: 'معاشات',
      action: [
        'salary_view',
        'salary_create',
        'salary_delete',
        'salary_restore',
        'salary_force_delete'
      ],
      allowRole: ['admin', 'finance_manager'],
    ),
    const RoleModel(
      systemId: 'exchanges',
      systemName: 'حواله',
      action: [
        'exchange_view',
        'exchange_create',
        'exchange_delete',
        'exchange_restore',
        'exchange_force_delete'
      ],
      allowRole: ['admin', 'finance_manager', 'bank_manager'],
    ),
    const RoleModel(
      systemId: 'orders',
      systemName: 'سفارشات',
      action: [
        'order_view',
        'order_create',
        'order_delete',
        'order_restore',
        'order_force_delete'
      ],
      allowRole: ['admin', 'finance_manager'],
    ),
    const RoleModel(
      systemId: 'cars',
      systemName: 'موتر ها',
      action: [
        'car_view',
        'car_create',
        'car_delete',
        'car_restore',
        'car_force_delete'
      ],
      allowRole: ['admin', 'finance_manager'],
    ),
    const RoleModel(
      systemId: 'incomes',
      systemName: 'رفت و آمد',
      action: [
        'income_view',
        'income_create',
        'income_delete',
        'income_restore',
        'income_force_delete'
      ],
      allowRole: ['admin', 'finance_manager'],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CTextField(
                hintText: "Name",
                value: state.name.value,
                setValue: (value) {
                  // context.read<UserCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CTextField(
                hintText: "Email",
                value: state.email.value,
                setValue: (value) {
                  // context.read<UserCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CPasswordField(
                value: state.password.value,
                setValue: (value) {
                  // context.read<UserCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CPasswordField(
                value: state.confirmPassword.value,
                setValue: (value) {
                  // context.read<UserCubit>().senderNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CDropdown(
                value: state.role.value,
                hintText: "Role",
                setValue: (value) {
                  List<RoleModel> data = [];

                  // final da = systemList.map((e1) {
                  //   return e1.allowRole.map((e2) {
                  //     if (e2 == value) {
                  //       return e1;
                  //     }
                  //   }).toList();
                  // }).toList();

                  context.read<UserCubit>().permissionChange(data);
                },
                items: const [
                  {
                    'value': 'admin',
                    'label': 'Admin',
                  },
                  {
                    'value': 'finance_manager',
                    'label': 'Finance Manager',
                  },
                  {
                    'value': 'bank_manager',
                    'label': 'Bank Manager',
                  },
                ],
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
