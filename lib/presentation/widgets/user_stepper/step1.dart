import 'package:cargo/logic/login/login_model.dart';
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
    const RoleModel(systemId: "users", systemName: "Users", action: [
      'user_view',
      'user_create',
      'user_delete',
      'user_restore',
      'user_force_delete'
    ], allowRole: [
      'admin'
    ])
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
                  // context.read<UserCubit>().currencyChange(value);
                },
                items: const [
                  {
                    'value': 'admin',
                    'label': 'Admin',
                  },
                  {
                    'label': 'Finance Manager',
                    'value': 'finance_manager',
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
