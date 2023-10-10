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
        'group_number': data.grandFatherName,
        'father_name': data.fatherName,
        'grand_father_name': data.grandFatherName,
        'tazkira_id': data.cardId,
        'customer_phone': data.customerPhone,
        'receiver_name': data.receiverName,
        'receiver_phone': data.receiverPhone,
        'country': data.country,
        'date': "2022-10-09 10:09:26.695295",
        'city': data.city,
        'address': data.address,
        'delivary_type': data.delivaryType,
        "extra_expense": [],
        'description': "this is description",
        "items": data.items
            .map((e) => {
                  'name': e.name,
                  'count': e.count,
                  'type': e.type,
                  'weight': e.weight
                })
            .toList(),
        'price_per_killo': 29292.2,
      };
      print(order.toString() + "this order");
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/v1/orders'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(order),
      );
    } catch (e) {}
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
      print(e.toString());
      return [];
    }
  }
}
