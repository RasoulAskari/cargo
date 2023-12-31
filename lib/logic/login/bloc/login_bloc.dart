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
  }

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {}
}
