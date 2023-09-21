import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incoming_out_going_event.dart';
part 'incoming_out_going_state.dart';

class IncomingOutGoingBloc extends Bloc<IncomingOutGoingEvent, IncomingOutGoingState> {
  IncomingOutGoingBloc() : super(IncomingOutGoingInitial()) {
    on<IncomingOutGoingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
