import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(httpClient: http.Client()),
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CTextField(
              hintText: "Email",
              value: '',
              maxlines: 1,
              setValue: (value) {
                context.read<LoginBloc>().add(SetEmailEvent(email: value));
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CTextField(
              hintText: "Password",
              value: '',
              maxlines: 1,
              setValue: (value) {
                context.read<LoginBloc>().add(SetEmailEvent(password: value));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(const SetLoginEvent(
                  email: 'admin.admin.com', password: 'password'));
            },
            child: Text("Login"),
          )
        ],
      ),
    ));
  }
}
