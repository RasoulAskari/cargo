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

  Future<Map<String, dynamic>> _onReportFetched(
      FetchReportEvent event, Emitter<ReportState> emitter) async {
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
        print(response.body);
        return jsonDecode(response.body);
      }
      return {};
    } catch (e) {
      print(e);
      return {};
    }
  }
}
