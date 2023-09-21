part of 'incoming_out_going_bloc.dart';

sealed class IncomingOutGoingState extends Equatable {
  const IncomingOutGoingState();
  
  @override
  List<Object> get props => [];
}

final class IncomingOutGoingInitial extends IncomingOutGoingState {}
