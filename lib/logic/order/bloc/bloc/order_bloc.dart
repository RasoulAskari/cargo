import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'order_event.dart';
part 'order_state.dart';

const _postLimit = 10;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final http.Client httpClient;

  OrderBloc({required this.httpClient}) : super(const OrderState()) {
    on<FetchOrderEvent>(_onEmployeesFetched);
  }

  Future<void> _onEmployeesFetched(
      FetchOrderEvent event, Emitter<OrderState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == OrderStatus.initial) {
        final employees = await _fetchEmployees(page: state.page);
        return emitter(
          state.copyWith(
            status: OrderStatus.success,
            orders: employees,
            hasReachedMax: employees.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List> _fetchEmployees({int? page}) async {
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

        // return body.map((e) {
        //   return EmployeeModel.fromMap(e);
        // }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
