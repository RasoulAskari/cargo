import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final Function isLogin;
  const LoginScreen({
    super.key,
    required this.isLogin,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _storage = const FlutterSecureStorage();

  Email email = const Email.pure();
  CString password = const CString.pure();

  Future<void> check() async {
    context.read<LoginBloc>().add(SetLoginEvent(
          email: email.value,
          password: password.value,
        ));
  }

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
                  email = Email.dirty(value);
                }),
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
                password = CString.dirty(value);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              check().then((value) async {
                await _storage.read(key: 'token');
                widget.isLogin();
              });
            },
            child: const Text("Login"),
          )
        ],
      ),
    ));
  }
}
