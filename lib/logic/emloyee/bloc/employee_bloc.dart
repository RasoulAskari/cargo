import 'dart:convert';
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
    on<AddEmployeeEvent>(_onAddEmployees);
  }

  Future<void> _onAddEmployees(
      AddEmployeeEvent event, Emitter<EmployeeState> emitter) async {
    EmployeeModel employee = event.employee;
    final data = {
      'phone_number': employee.phoneNumber,
      'first_name': employee.firstName,
      'last_name': employee.lastName,
      'email': employee.email,
      'permenent_address': employee.permenentAddress,
      'current_address': employee.currentAddress,
      'employment_start_date': employee.startDate,
      'employment_end_date': employee.endDate,
      'job_title': "Developer",
      'profile': "Sha Rasoul"
    };

    try {
      final response = await httpClient.post(
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        getServerRoute(
          route: '/api/v1/employees',
          params: data,
        ),
      );
    } catch (e) {}
  }

  Future<void> _onEmployeesFetched(
      EmployeesFetched event, Emitter<EmployeeState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == EmployeeStatus.initial) {
        final employees = await _fetchEmployees(page: state.page);
        // ignore: invalid_use_of_visible_for_testing_member
        return emit(
          state.copyWith(
            status: EmployeeStatus.success,
            employees: employees,
            hasReachedMax: employees.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<EmployeeModel>> _fetchEmployees({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/employees',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
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
