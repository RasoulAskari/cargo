import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'salary_event.dart';
part 'salary_state.dart';

const _postLimit = 10;

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  final http.Client httpClient;

  SalaryBloc({required this.httpClient}) : super(const SalaryState()) {
    on<AddSalaryEvent>(_onAddSalaryOutGoingEvent);
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

  Future<void> _onAddSalaryOutGoingEvent(
      AddSalaryEvent event, Emitter<SalaryState> emitter) async {
    if (state.hasReachedMax) return;
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

      emitter(
        state.copyWith(
            // salary_out_going: List.of(state.salary_out_going)
            //   ..insert(0, event.salaryOutGoing),
            ),
      );
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
