import 'package:bloc/bloc.dart';
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

    _userLogin();
  }

  Future<void> _userLogin() async {
    
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
