import 'package:bloc/bloc.dart';
import 'package:cargo/logic/report/model/report_model.dart';
import 'package:equatable/equatable.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const ReportState()) {
    on<FetchReportEvent>();
  }

  Future<void> _onOrdersFetched(
      FetchReportEvent event, Emitter<ReportState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ReportStatus.initial) {
        final orders = await _fetchOrders(page: state.page);
        return emitter(
          state.copyWith(
            status: ReportStatus.success,
            reports: orders,
            hasReachedMax: orders.length < _postLimit,
          ),
        );
      }
    } catch (e) {
      return;
    }
  }
}
