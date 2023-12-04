import 'package:bloc/bloc.dart';
import 'package:cargo/logic/car/model/car_model.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'car_event.dart';
part 'car_state.dart';

const _postLimit = 10;

class CarBloc extends Bloc<CarEvent, CarState> {
  final http.Client httpClient;

  CarBloc({required this.httpClient}) : super(const CarState()) {
    on<FetchCarEvent>(_onOrdersFetched);
  }

  Future<void> _onOrdersFetched(
      FetchCarEvent event, Emitter<CarState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == CarStatus.initial) {
        final cars = await _fetchCars(page: state.page);
        return emitter(
          state.copyWith(
            status: CarStatus.success,
            cars: cars,
            hasReachedMax: cars.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }

  Future<List<CarModel>> _fetchCars({int? page}) async {
    final token = await getAuthToken();
    try {
      final response = await httpClient.get(
        getServerRoute(
          route: '/api/v1/cars',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // final body = json.decode(response.body)["data"] as List;
        // return body.map((e) {
        //   return CarModel.fromMap(e);
        // }).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
