import 'package:bloc/bloc.dart';
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
      SetLoginEvent event, Emitter<LoginState> emitter) async {}

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {
    await http.post(
      Uri.parse('http://localhost:8000/api/v1/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
      },
      // body: jsonEncode(order),
    );

    try {
      if (state.status == EmployeeStatus.initial) {}

      // final employees = await _fetchEmployees(page: state.page + 1);
    } catch (e) {
      return;
    }
  }
}
