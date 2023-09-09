import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/login/login_model.dart';
import 'package:cargo/logic/login/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

const _postLimit = 10;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final http.Client httpClient;

  LoginBloc({required this.httpClient}) : super(const LoginState()) {
    on<SetEmailEvent>(_onSetEmailEvent);
    on<SetLoginEvent>(_onLoginningEvent);
  }

  Future<void> _onLoginningEvent(
      SetLoginEvent event, Emitter<LoginState> emitter) async {
    if (state.hasReachedMax) return;

    final result = await _userLogin(
      event.email,
      event.password,
    );
    print(result);
  }

  Future<UserModel?> _userLogin(String email, String password) async {
    try {
      final response = await httpClient.post(
        getServerRoute(
          route: '/api/v1/login',
          params: {'email': email, 'password': password},
        ),
      );
      final result = json.decode(response.body);

      if (result['result']) {
        print(result['result']['name']);
        UserModel mo = UserModel(
          name: result['result']['name'] as String,
          email: result['result']['email'] as String,
          token: result['token'] as String,
        );

        print(mo);
      }
    } catch (e) {
      print(e.toString() + 'Catch');
    }
  }

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == EmployeeStatus.initial) {}

      // final employees = await _fetchEmployees(page: state.page + 1);
    } catch (e) {}
  }
}
