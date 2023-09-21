import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/screens/incoming_out_going.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'incoming_out_going_event.dart';
part 'incoming_out_going_state.dart';

const _postLimit = 10;

class IncomingOutGoingBloc
    extends Bloc<IncomingOutGoingEvent, IncomingOutGoingState> {
  final http.Client httpClient;

  IncomingOutGoingBloc({required this.httpClient})
      : super(const IncomingOutGoingState()) {
    on<IncomingOutGoingFetchEvent>(_onIncomingOutGoingEvent);
  }

  Future<void> _onIncomingOutGoingEvent(IncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == IncomingOutGoingStatus.initial) {
        final incoming_out_going =
            await _fetchincoming_out_going(page: state.page);
        // ignore: invalid_use_of_visible_for_testing_member
        return emit(
          state.copyWith(
            status: IncomingOutGoingStatus.success,
            incoming_out_going: incoming_out_going,
            hasReachedMax: incoming_out_going.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<IncomingOutGoing>> _fetchincoming_out_going({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/incoming_out_going',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;

        // return body.map((e) {
        //   return IncomingOutGoing.fromMap(e);
        // }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
