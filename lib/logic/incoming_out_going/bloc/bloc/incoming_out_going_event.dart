part of 'incoming_out_going_bloc.dart';

sealed class IncomingOutGoingEvent extends Equatable {
  const IncomingOutGoingEvent();

  @override
  List<Object> get props => [];
}

class IncomingOutGoingFetchEvent extends IncomingOutGoingEvent {}

class AddIncomingOutGoingEvent extends IncomingOutGoingEvent {
  final IncomingOutGoing incomingOutGoing;

  AddIncomingOutGoingEvent({required this.incomingOutGoing});
}
