import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  final Function next;
  final Function prev;

  const Step1({super.key, required this.next, required this.prev});

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
          

        ],
      ),
    );
  }
}
