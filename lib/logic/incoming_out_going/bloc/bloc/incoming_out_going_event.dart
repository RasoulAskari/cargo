part of 'incoming_out_going_bloc.dart';

sealed class IncomingOutGoingEvent extends Equatable {
  const IncomingOutGoingEvent();

  @override
  List<Object> get props => [];
}

class IncomingOutGoingFetchEvent extends IncomingOutGoingEvent {}

class AddIncomingOutGoingEvent extends IncomingOutGoingEvent {
  final IncomingOutGoing incomingOutGoing;
  final DateTime? date;

  const AddIncomingOutGoingEvent(
      {required this.incomingOutGoing, required this.date, DateTime? dateTime});
}

class EditIncomingOutGoingEvent extends IncomingOutGoingEvent {
  final IncomingOutGoing incomingOutGoing;

  const EditIncomingOutGoingEvent({
    required this.incomingOutGoing,
  });
}
