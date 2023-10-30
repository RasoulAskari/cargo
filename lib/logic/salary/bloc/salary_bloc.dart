import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/constants/routes.dart';
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
    on<DeleteSalaryEvent>(_onDleteSalaryEvent);
    on<EditSalaryEvent>(_onEditSalaryEvent);
  }

  Future<void> _onEditSalaryEvent(
      EditSalaryEvent event, Emitter<SalaryState> emitter) async {
    final token = await getAuthToken();

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
      final res = await http.put(
        Uri.parse('${apiRoute}income-outgoing/${salary.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      emitter(state.copyWith(
          salary: state.salary.map((e) {
        if (e.id == event.salary.id) {
          return SalaryModel.fromJson(res.body);
        } else {
          return e;
        }
      }).toList()));
    } catch (e) {
      return;
    }
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
      final token = await getAuthToken();

      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/salary-payments',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
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
      return [];
    }
  }

  Future<void> _onAddSalaryEvent(
      AddSalaryEvent event, Emitter<SalaryState> emitter) async {
    final token = await getAuthToken();

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
      await http.post(
        Uri.parse('${apiRoute}salary-payments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      emitter(
        state.copyWith(
          salary: List.of(state.salary)..insert(0, event.salary),
        ),
      );
    } catch (e) {
      return;
    }
  }

  Future<void> _onDleteSalaryEvent(
      DeleteSalaryEvent event, Emitter<SalaryState> emitter) async {
    final token = await getAuthToken();

    var res = await httpClient.delete(
      getServerRoute(
        route: '/api/v1/salary-payments/${event.id}',
      ),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (res.body == "1") {
      emitter(
        state.copyWith(
          salary: state.salary
              .where(
                (element) => element.id != event.id,
              )
              .toList(),
        ),
      );
    }
  }
}
