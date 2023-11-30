// ignore_for_file: file_names

import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/login/bloc/login_bloc.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

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
  Email email = const Email.pure();
  CString password = const CString.pure();
  final storage = const FlutterSecureStorage();

  Future<void> login() async {
    final data = {
      "email": email.value,
      "password": password.value,
    };
    try {
      final res = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/v1/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final response = jsonDecode(res.body);

      if (response['result']) {
        final jsonDataEncoded = jsonEncode(response);
        await storage.write(key: "user", value: jsonDataEncoded);
        await storage.read(key: 'user');
      }
    } catch (e) {

      return;
    }
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
                hintText: AppLocalizations.of(context)?.email,
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
              hintText: AppLocalizations.of(context)?.password,
              value: '',
              maxlines: 1,
              setValue: (value) {
                password = CString.dirty(value);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await login();
              await widget.isLogin();
            },
            child: const Text("Login"),
          ),
        ],
      ),
    ));
  }
}
