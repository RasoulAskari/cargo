import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/incoming_out_going/model/incoming_out_going.dart';
import 'package:cargo/presentation/screens/incoming_out_going_screen.dart';
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
    on<AddIncomingOutGoingEvent>(_onAddIncomingOutGoingEvent);
    on<EditIncomingOutGoingEvent>(_onEditIncomingOutGoingEvent);
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

  Future<void> _onEditIncomingOutGoingEvent(EditIncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
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
      final response = await http.put(
        Uri.parse('http://localhost:8000/api/v1/income-outgoing/${1}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  Future<void> _onAddIncomingOutGoingEvent(AddIncomingOutGoingEvent event,
      Emitter<IncomingOutGoingState> emitter) async {
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
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/v1/income-outgoing'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  Future<List<IncomingOutGoing>> _fetchincoming_out_going({int? page}) async {
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/income-outgoing',
        ),
        headers: <String, String>{
          'Authorization':
              'Bearer 1|2bcCa0xSXyODRPkS4AhEZSFSmr4OkmGVr9jv6Zw02881823b',
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
      print(e);
      return [];
    }
  }
}
