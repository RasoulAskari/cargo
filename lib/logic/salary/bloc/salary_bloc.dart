import 'package:bloc/bloc.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'salary_event.dart';
part 'salary_state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  final http.Client httpClient;

  SalaryBloc({required this.httpClient}) : super(const SalaryState()) {}
}
