import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/user/bloc/user_bloc.dart';
import 'package:cargo/logic/user/cubit/cubit/user_cubit.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:cargo/logic/user/model/user_privileges.dart';
import 'package:cargo/presentation/widgets/user_stepper/step2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/stepper/c_stepper.dart';
import '../widgets/user_stepper/step1.dart';

class AddUserScreen extends StatefulWidget {
  final MyUser? user;
  const AddUserScreen({super.key, this.user});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  void initState() {
    _checkUser();
    super.initState();
  }

  _checkUser() {
    if (widget.user != null) {
      final user = widget.user;
      context.read<UserCubit>().nameChange(user!.name);
      context.read<UserCubit>().emailChange(user.email);
      context.read<UserCubit>().roleChange(user.role);
      context
          .read<UserCubit>()
          .privilegeChange(UserPrivileage(allowRole: user.permissions));
    }
  }

  late http.Client httpClient;

  Future<void> _submit() async {
    final state = context.read<UserCubit>().state;

    final data = state.privileges.value!.allowRole;

    MyUser user = MyUser(
        id: widget.user == null ? 0 : widget.user!.id,
        name: state.name.value,
        email: state.email.value,
        role: state.role.value,
        password: state.password.value,
        confirmPassword: state.confirmPassword.value,
        permissions: data);

    widget.user == null
        ? context.read<UserBloc>().add(
              AddUserEvent(user: user),
            )
        : context.read<UserBloc>().add(
              UpdateUserEvent(user: user),
            );

    Navigator.of(context).pushReplacementNamed(userScreen);
  }

  var step = 1;
  bool loading = false;

  next(steps) {
    setState(() {
      step = step + 1;
    });
  }

  prev(steps) {
    if (step == 1) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      step = step - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List steps = [
      {
        'title': "Info About The Person\nwhom Order ",
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
      {
        'title': "Info About The Receiver",
        'step': Step2(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CStepper(
            prev: () {
              prev(steps);
            },
            loading: loading,
            stepAmount: 2,
            steps: steps,
            step: step,
            next: () {
              next(steps);
            },
            onSubmit: () async {
              _submit();
            }));
  }
}
