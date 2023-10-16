import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:cargo/logic/login/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final storeage = const FlutterSecureStorage();

  final http.Client httpClient;

  LoginBloc({required this.httpClient}) : super(const LoginState()) {
    on<SetEmailEvent>(_onSetEmailEvent);
    on<SetLoginEvent>(_onLoginningEvent);
  }

  Future<void> _onLoginningEvent(
      SetLoginEvent event, Emitter<LoginState> emitter) async {
    try {
      final data = {
        "email": event.email,
        "password": event.password,
      };
      final res = await http.post(
        Uri.parse('http://localhost:8000/api/v1/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final response = jsonDecode(res.body);

      print(response['token']);

      emitter(
        state.copyWith(
          user: [
            LoginModel(
                token: response['token'],
                date: response['user']['created_at'],
                email: response['user']['email'],
                password: "password")
          ],
        ),
      );
    } catch (e) {
      print(e.toString() + "idididid");
    }
  }

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {}
}
