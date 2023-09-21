part of 'incoming_out_going_bloc.dart';

enum IncomingOutGoingStatus { initial, success, failure }

class IncomingOutGoingState extends Equatable {
  const IncomingOutGoingState({
    this.status = IncomingOutGoingStatus.initial,
    this.incoming_out_going = const <IncomingOutGoing>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final IncomingOutGoingStatus status;
  final List<IncomingOutGoing> incoming_out_going;
  final int page;
  final bool hasReachedMax;

  IncomingOutGoingState copyWith({
    IncomingOutGoingStatus? status,
    List<IncomingOutGoing>? incoming_out_going,
    bool? hasReachedMax,
    int? page,
  }) {
    return IncomingOutGoingState(
      status: status ?? this.status,
      incoming_out_going: incoming_out_going ?? this.incoming_out_going,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''IncomingOutGoingState { status: $status, hasReachedMax: $hasReachedMax, incoming_out_going: ${incoming_out_going.length} }''';
  }

  @override
  List<Object> get props => [status, incoming_out_going, hasReachedMax, page];
}
