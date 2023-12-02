import 'package:bloc/bloc.dart';
import 'package:cargo/logic/report/model/report_model.dart';
import 'package:equatable/equatable.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const ReportState()) {
    on<ReportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
