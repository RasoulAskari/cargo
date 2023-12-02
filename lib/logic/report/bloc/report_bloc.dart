import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/report/model/report_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'report_event.dart';
part 'report_state.dart';

const _postLimit = 10;

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final http.Client httpClient;

  ReportBloc({required this.httpClient}) : super(const ReportState()) {
    on<FetchReportEvent>(_onReportFetched);
  }

  Future<void> _onReportFetched(
      FetchReportEvent event, Emitter<ReportState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ReportStatus.initial) {
        final orders = await _fetchOrders(page: state.page);
        return emitter(
          state.copyWith(
            status: ReportStatus.success,
            reports: orders,
            hasReachedMax: orders.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<ReportModel>> _fetchOrders({int? page}) async {
    final token = await getAuthToken();
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/analytics',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        print(body);
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
