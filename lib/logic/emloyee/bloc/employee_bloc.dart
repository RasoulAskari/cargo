import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';

part 'employee_event.dart';
part 'employee_state.dart';

const _postLimit = 10;

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(const EmployeeState()) {
    on<EmployeesFetched>(_onEmployeesFetched);
  }

  Future<void> _onEmployeesFetched(
      EmployeesFetched event, Emitter<EmployeeState> emitter) async {
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
      emit(
        employees.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: EmployeeStatus.success,
                employees: List.of(state.employees)..addAll(employees),
                hasReachedMax: false,
                page: state.page + 1,
              ),
      );
    } catch (e) {}
  }

  Future<List<EmployeeModel>> _fetchEmployee(
      {required String postId, required int page}) async {
    String? token = await getAuthToken();
    final response = await httpClient.get(
      getServerRoute(
        route: '/api/v1/comments/$postId',
        params: {
          'page': '$page',
          'post_id': postId,
        },
      ),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body)["data"] as List;
    throw Exception('error fetching posts');
  }
}
