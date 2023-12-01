import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/constants/routes.dart';
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
    on<FetchOrderEvent>(_onOrdersFetched);
    on<AddOrderEvent>(_onorderAdd);
    on<FetchCurrentCar>(_fetchCurrentCar);
    on<DeleteOrderEvent>(_onDeleteOrder);
  }

  Future<Map<String, dynamic>> fetchData() async {
    final token = await getAuthToken();
    try {
      final response = await http.get(
        Uri.parse('${apiRoute}current-car'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      return {};
    } catch (e) {
      return {};
    }
  }

  Future<void> _onorderAdd(
      AddOrderEvent event, Emitter<OrderState> emitter) async {
    try {
      OrderModel data = event.order;
      final token = await getAuthToken();

      final order = {
        'customer_name': data.customerName,
        'father_name': data.fatherName,
        'grand_father_name': data.grandFatherName,
        'tazkira_id': data.cardId,
        'customer_phone': data.customerPhone,
        'receiver_name': data.receiverName,
        'receiver_phone': data.receiverPhone,
        'country': data.country,
        'date': data.date,
        'paid_amount': 0,
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
      await fetchData().then((value) => {
            order['group_number'] = value['group_number'],
            order['car_id'] = value['car_id'],
          });

      final res = await http.post(
        Uri.parse('${apiRoute}orders'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(order),
      );
      emitter(state.copyWith(
        orders: List.of(state.orders)..insert(0, event.order),
      ));
    } catch (e) {
      return;
    }
  }

  Future<void> _onOrdersFetched(
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

  Future<Map> _fetchCurrentCar(
      FetchCurrentCar event, Emitter<OrderState> emitter) async {
    final token = await getAuthToken();
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/current-car',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response.body as Map;
      }
      return {};
    } catch (e) {
      return {};
    }
  }

  Future<List<OrderModel>> _fetchOrders({int? page}) async {
    final token = await getAuthToken();
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/orders',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
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

  Future<void> _onDeleteOrder(
      DeleteOrderEvent event, Emitter<OrderState> emitter) async {
    try {
      final token = await getAuthToken();
      final ids = event.id;
      const type = 'delete';
      var res = await http.delete(
        Uri.parse("$apiRoute$type/orders/$ids"),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (res.body == "1") {
        emitter(
          state.copyWith(
            orders: state.orders
                .where((element) => element.id != event.id)
                .toList(),
          ),
        );
      }
    } catch (e) {
      return;
    }
  }
}
