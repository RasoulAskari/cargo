import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient;

  UserBloc({required this.httpClient}) : super(const UserState()) {
    on<AddUserEvent>(_onAddEmployees);
    // on<AddUserEvent>(_onAddUser);
  }

  Future<void> _onAddEmployees(
      AddUserEvent event, Emitter<UserState> emitter) async {
    final token = await getAuthToken();

    MyUser userData = event.user;

    final data = {
      'email': userData.email,
      'password': userData.password,
      'confirm_password': userData.confirmPassword,
      'role': userData.role,
      'permissions': userData.permissions.toString(),
      'name': userData.name,
    };

    try {
      await http.post(
        Uri.parse('http://localhost:8000/api/v1/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      emitter(state.copyWith(
        users: List.of(state.users)..insert(0, event.user),
      ));
    } catch (e) {
      return;
    }
  }

  Future<void> _onAddUser(
      AddUserEvent event, Emitter<UserState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == UserStatus.initial) {
        final incomingOutGoing = await _fetch_users(page: state.page);
        return emitter(
          state.copyWith(
            status: UserStatus.success,
            users: incomingOutGoing,
            hasReachedMax: incomingOutGoing.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<MyUser>> _fetch_users({int? page}) async {
    final token = await getAuthToken();

    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/users',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        return body.map((e) {
          return MyUser.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
