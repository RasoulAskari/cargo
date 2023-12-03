import 'package:bloc/bloc.dart';
import 'package:cargo/logic/car/model/car_model.dart';
import 'package:equatable/equatable.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc() : super(const CarState()) {
    on<CarEvent>((event, emit) {});
  }
}
