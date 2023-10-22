import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:cargo/logic/user/model/role_model.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient;

  UserBloc({required this.httpClient}) : super(const UserState()) {
    on<AddUserEvent>(_onAddEmployees);
  }

  Future<void> _onAddEmployees(
      AddUserEvent event, Emitter<UserState> emitter) async {
    final token = await getAuthToken();

    MyUser userData = event.user;
    // final per = userData.permissions;

    final data = {
      'email': userData.email,
      'password': userData.password,
      'confirm_password': userData.confirmPassword,
      'role': userData.role,
      'permissions': [],
      'name': userData.name,
    };

    try {
      // await httpClient.post(
      //   headers: <String, String>{
      //     'Authorization': 'Bearer $token',
      //   },
      //   getServerRoute(
      //     route: '/api/v1/users',
      //     params: data,
      //   ),
      // );
      // emitter(state.copyWith(
      //   users: List.of(state.users)..insert(0, event.user),
      // ));
    } catch (e) {
      return;
    }
  }
}
