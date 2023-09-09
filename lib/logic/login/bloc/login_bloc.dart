import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/login/login_model.dart';
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

    String? email = event.email;

    _userLogin(
      event.email,
      event.password,
    );
  }

  Future<void> _userLogin(String email, String password) async {
    try {
      final response = await httpClient.post(
        getServerRoute(
          route: '/api/v1/login',
          params: {'email': email, 'password': password},
        ),
      );
      print(response.body);
    } catch (e) {}
  }

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == EmployeeStatus.initial) {
        // final employees = await _fetchEmployees(page: state.page);
        // return emit(
        //   state.copyWith(
        //     status: EmployeeStatus.success,
        //     employees: employees,
        //     hasReachedMax: employees.length < _postLimit,
        //   ),
        // );
      }

      // final employees = await _fetchEmployees(page: state.page + 1);
    } catch (e) {}
  }
}
