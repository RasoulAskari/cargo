// ignore_for_file: file_names

import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
import 'package:cargo/utils/stepper/bard_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
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
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            const BrandBg(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  height: 20,
                )),
                AnimatedSwitcher(
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: const Interval(0.0, 1.0),
                        ),
                      ),
                      child: child,
                    );
                  },
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                              ),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height -
                                      MediaQuery.of(context).viewInsets.bottom -
                                      500,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 50),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: InputLabel(label: "Email"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: CTextField(
                                              hintText:
                                                  AppLocalizations.of(context)
                                                      ?.email,
                                              value: '',
                                              maxlines: 1,
                                              setValue: (value) {
                                                email = Email.dirty(value);
                                              }),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: InputLabel(label: "Password"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: CTextField(
                                            hintText:
                                                AppLocalizations.of(context)
                                                    ?.password,
                                            value: '',
                                            maxlines: 1,
                                            setValue: (value) {
                                              password = CString.dirty(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(bottom: 0, top: 20),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(500.0),
                                    onTap: () {
                                      login();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(500.0),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Icon(
                                        Icons.check,
                                        size: 30.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
