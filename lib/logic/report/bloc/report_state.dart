part of 'report_bloc.dart';

enum ReportStatus { initial, success, failure }

class ReportState extends Equatable {
  const ReportState({
    this.status = ReportStatus.initial,
    this.reports = const <Map<String, dynamic>>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final ReportStatus status;
  final List<Map<String, dynamic>> reports;
  final int page;
  final bool hasReachedMax;

  ReportState copyWith({
    ReportStatus? status,
    List<Map<String, dynamic>>? reports,
    bool? hasReachedMax,
    int? page,
  }) {
    return ReportState(
      status: status ?? this.status,
      reports: reports ?? this.reports,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''ReportState { status: $status, hasReachedMax: $hasReachedMax, reports: ${reports.length} }''';
  }

  @override
  List<Object> get props => [status, reports, hasReachedMax, page];
}
