import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'salary_event.dart';
part 'salary_state.dart';

const _postLimit = 10;

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  final http.Client httpClient;

  SalaryBloc({required this.httpClient}) : super(const SalaryState()) {
    on<AddSalaryEvent>(_onAddSalaryEvent);
    on<FetchSalaryEvent>(_onFetchSalaryOutGoingEvent);
  }
  Future<void> _onFetchSalaryOutGoingEvent(
      FetchSalaryEvent event, Emitter<SalaryState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == SalaryStatus.initial) {
        final employees = await _fetchEmployees(page: state.page);
        // ignore: invalid_use_of_visible_for_testing_member
        return emitter(
          state.copyWith(
            status: SalaryStatus.success,
            salary: employees,
            hasReachedMax: employees.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<SalaryModel>> _fetchEmployees({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/salary-payments',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;

        return body.map((e) {
          return SalaryModel.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> _onAddSalaryEvent(
      AddSalaryEvent event, Emitter<SalaryState> emitter) async {
    SalaryModel salary = event.salary;

    final data = {
      'employee_id': salary.employee.id,
      'created_at': salary.date.toString(),
      'employee': {
        'id': salary.employee.id,
        "salary": salary.employee.salary,
        'first_name': salary.employee.firstName,
        'last_name': salary.employee.lastName
      },
      'amount': salary.salaryAmount,
      "paid": salary.payAmount
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/v1/salary-payments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(data),
      );
      print(response.body);
      emitter(
        state.copyWith(
          salary: List.of(state.salary)..insert(0, event.salary),
        ),
      );
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
