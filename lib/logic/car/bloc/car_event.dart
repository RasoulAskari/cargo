part of 'car_bloc.dart';

sealed class CarEvent extends Equatable {
  const CarEvent();

  @override
  List<Object> get props => [];
}

class FetchCarEvent extends CarEvent {}
