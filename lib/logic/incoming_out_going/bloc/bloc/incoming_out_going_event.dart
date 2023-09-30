part of 'incoming_out_going_bloc.dart';

sealed class IncomingOutGoingEvent extends Equatable {
  const IncomingOutGoingEvent();

  @override
  List<Object> get props => [];
}

class IncomingOutGoingFetchEvent extends IncomingOutGoingEvent {}

class AddIncomingOutGoingEvent extends IncomingOutGoingEvent {
  final IncomingOutGoing incomingOutGoing;
  final DateTime dateTime;

  AddIncomingOutGoingEvent(this.dateTime, {required this.incomingOutGoing});
}
