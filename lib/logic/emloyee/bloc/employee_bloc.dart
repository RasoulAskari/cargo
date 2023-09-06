import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/emloyee/model/employee_model.dart';
import 'package:http/http.dart' as http;
part 'employee_event.dart';
part 'employee_state.dart';

const _postLimit = 10;

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final http.Client httpClient;

  EmployeeBloc({required this.httpClient}) : super(const EmployeeState()) {
    on<EmployeesFetched>(_onEmployeesFetched);
  }

  Future<void> _onEmployeesFetched(
      EmployeesFetched event, Emitter<EmployeeState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == EmployeeStatus.initial) {
        print('first');
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

  Future<List<EmployeeModel>> _fetchEmployees({int? page}) async {
    String? token = await getAuthToken();
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

      
    }
    print(state.employees);
    throw Exception("do you ");
  }
}
