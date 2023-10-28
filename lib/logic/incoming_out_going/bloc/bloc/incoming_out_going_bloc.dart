import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/routes.dart';

part 'incoming_out_going_event.dart';
part 'incoming_out_going_state.dart';

const _postLimit = 10;

class IncomingOutGoingBloc
    extends Bloc<IncomingOutGoingEvent, IncomingOutGoingState> {
  final http.Client httpClient;

  IncomingOutGoingBloc({required this.httpClient})
      : super(const IncomingOutGoingState()) {
    on<IncomingOutGoingFetchEvent>(_onIncomingOutGoingEvent);
    on<AddIncomingOutGoingEvent>(_onAddIncomingOutGoingEvent);
    on<EditIncomingOutGoingEvent>(_onEditIncomingOutGoingEvent);
    on<DeleteIncomingOutGoingEvent>(_onDleteIncomingOutGoingEvent);
  }

  Future<void> _onDleteIncomingOutGoingEvent(DeleteIncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
    final token = await getAuthToken();

    var res = await httpClient.delete(
      getServerRoute(
        route: '/api/v1/income-outgoing/${event.id}',
      ),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (res.body == "true") {
      emitter(
        state.copyWith(
          incoming_out_going: state.incoming_out_going
              .where((element) => element.id != event.id)
              .toList(),
        ),
      );
    }
  }

  Future<void> _onIncomingOutGoingEvent(IncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == IncomingOutGoingStatus.initial) {
        final incomingOutGoing =
            await _fetchincoming_out_going(page: state.page);
        return emitter(
          state.copyWith(
            status: IncomingOutGoingStatus.success,
            incoming_out_going: incomingOutGoing,
            hasReachedMax: incomingOutGoing.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<void> _onEditIncomingOutGoingEvent(EditIncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
    final token = await getAuthToken();

    if (state.hasReachedMax) return;
    IncomingOutGoing incoming = event.incomingOutGoing;
    final data = {
      'name': incoming.name.toString(),
      'type': incoming.type.toString(),
      'amount': incoming.amount,
      "created_by": incoming.createdBy.id,
      "created_at": incoming.createdAt
    };

    try {
      await http.put(
        Uri.parse('${apiRoute}income-outgoing/${incoming.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      return;
    }
  }

  Future<void> _onAddIncomingOutGoingEvent(AddIncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
    final token = await getAuthToken();

    if (state.hasReachedMax) return;
    IncomingOutGoing incoming = event.incomingOutGoing;
    final data = {
      'name': incoming.name.toString(),
      'type': incoming.type.toString(),
      'amount': incoming.amount,
      "created_by": incoming.createdBy.id,
      "created_at": event.date.toString()
    };

    try {
      await http.post(
        Uri.parse('${apiRoute}income-outgoing'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      emitter(
        state.copyWith(
          incoming_out_going: List.of(state.incoming_out_going)
            ..insert(0, event.incomingOutGoing),
        ),
      );
    } catch (e) {
      return;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<IncomingOutGoing>> _fetchincoming_out_going({int? page}) async {
    final token = await getAuthToken();

    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/income-outgoing',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body)["data"] as List;
        return body.map((e) {
          return IncomingOutGoing.fromMap(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
