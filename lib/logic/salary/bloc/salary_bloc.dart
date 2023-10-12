import 'package:bloc/bloc.dart';
import 'package:cargo/logic/salary/model/salary_model.dart';
import 'package:equatable/equatable.dart';

part 'salary_event.dart';
part 'salary_state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryInitial()) {
    on<SalaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
