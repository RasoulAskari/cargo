// ignore_for_file: file_names

import 'package:cargo/config/localization.dart';
import 'package:cargo/constants/routes.dart';
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
        Uri.parse('${apiRoute}login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      print(res.body);

      final response = jsonDecode(res.body);
      print("mdmdm");

      if (response['result']) {
        print("nnnn");

        final jsonDataEncoded = jsonEncode(response);
        await storage.write(key: "user", value: jsonDataEncoded);
        await storage.read(key: 'user');
      }
    } catch (e) {
      print("mdmdm");

      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //     child: Column(
      //   children: [
      //     const SizedBox(height: 50),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16),
      //       child: InputLabel(label: "Email"),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16),
      //       child: CTextField(
      //           hintText: AppLocalizations.of(context)?.email,
      //           value: '',
      //           maxlines: 1,
      //           setValue: (value) {
      //             email = Email.dirty(value);
      //           }),
      //     ),
      //     const SizedBox(
      //       height: 25,
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(
      //         horizontal: 16,
      //       ),
      //       child: InputLabel(label: "Password"),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16),
      //       child: CTextField(
      //         hintText: AppLocalizations.of(context)?.password,
      //         value: '',
      //         maxlines: 1,
      //         setValue: (value) {
      //           password = CString.dirty(value);
      //         },
      //       ),
      //     ),
      //     ElevatedButton(
      //       child: Text("login"),
      //       onPressed: () {
      //         login();
      //       },
      //     )
      //   ],
      // )),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            const BrandBg(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 8 * 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
