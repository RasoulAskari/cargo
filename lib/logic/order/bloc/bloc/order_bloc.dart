import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/order/model/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'order_event.dart';
part 'order_state.dart';

const _postLimit = 10;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final http.Client httpClient;

  OrderBloc({required this.httpClient}) : super(const OrderState()) {
    on<FetchOrderEvent>(_onordersFetched);
    on<AddOrderEvent>(_onorderAdd);
  }

  Future<void> _onorderAdd(
      AddOrderEvent event, Emitter<OrderState> emitter) async {
    try {
      OrderModel data = event.order;

      final order = {
        'car_id': data.cardId,
        'customer_name': data.customerName,
        'group_number': data.customerName,
        'father_name': data.customerName,
        'grand_father_name': data.customerName,
        'tazkira_id': data.customerName,
        'customer_phone': data.customerName,
        'receiver_name': data.customerName,
        'receiver_phone': data.customerName,
        'country': data.customerName,
        'city': data.customerName,
        'address': data.customerName,
        'delivary_type': data.customerName,
        'description': "this is description",
        'price_per_killo': data.customerName,
      };

      final response = await httpClient.post(
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        getServerRoute(
          route: '/api/v1/orders',
          params: order,
        ),
      );
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _onordersFetched(
      FetchOrderEvent event, Emitter<OrderState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == OrderStatus.initial) {
        final orders = await _fetchOrders(page: state.page);
        return emitter(
          state.copyWith(
            status: OrderStatus.success,
            orders: orders,
            hasReachedMax: orders.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<OrderModel>> _fetchOrders({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/orders',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        return body.map((e) {
          return OrderModel.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
