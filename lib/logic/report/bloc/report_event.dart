part of 'report_bloc.dart';

sealed class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class FetchReportEvent extends ReportEvent {}
