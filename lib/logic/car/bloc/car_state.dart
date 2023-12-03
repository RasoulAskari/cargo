part of 'car_bloc.dart';

enum CarStatus { initial, success, failure }

class CarState extends Equatable {
  const CarState({
    this.status = CarStatus.initial,
    this.cars = const <CarModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final CarStatus status;
  final List<CarModel> cars;
  final int page;
  final bool hasReachedMax;

  CarState copyWith({
    CarStatus? status,
    List<CarModel>? cars,
    bool? hasReachedMax,
    int? page,
  }) {
    return CarState(
      status: status ?? this.status,
      cars: cars ?? this.cars,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''CarState { status: $status, hasReachedMax: $hasReachedMax, cars: ${cars.length} }''';
  }

  @override
  List<Object> get props => [status, cars, hasReachedMax, page];
}
