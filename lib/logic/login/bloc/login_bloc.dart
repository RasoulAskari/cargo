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
  }

  Future<void> _onSetEmailEvent(
      SetEmailEvent event, Emitter<LoginState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == EmployeeStatus.initial) {
        final employees = await _fetchEmployees(page: state.page);
        return emit(
          state.copyWith(
            status: EmployeeStatus.success,
            employees: employees,
            hasReachedMax: employees.length < _postLimit,
          ),
        );
      }

      final employees = await _fetchEmployees(page: state.page + 1);
    } catch (e) {}
  }

  Future<List<EmployeeModel>> _fetchEmployees({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/employees',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|NgjRNdzgFryBA3hy0Hs6Kech0PAhnYJcradT32axb7dda787',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        return body.map((e) {
          return EmployeeModel.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
