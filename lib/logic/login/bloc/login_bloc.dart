import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/login/login_model.dart';
import 'package:cargo/logic/login/user_model.dart';
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
    if (state.hasReachedMax) return;
  
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
        Map<String, dynamic> data = jsonDecode(response.body)['user'];
        final exist = await storeage.read(key: 'token');

        if (exist == null) {
          await storeage.write(key: "token", value: result['token']);
          await storeage.read(key: 'token');

          UserModel res = UserModel(
              email: data['email'], id: data['id'], name: data['name']);
          return res;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
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
