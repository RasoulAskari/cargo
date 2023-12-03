part of 'car_bloc.dart';

sealed class CarState extends Equatable {
  const CarState();
  
  @override
  List<Object> get props => [];
}

final class CarInitial extends CarState {}
