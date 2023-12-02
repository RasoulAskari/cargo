part of 'report_bloc.dart';

sealed class ReportState extends Equatable {
  const ReportState();
  
  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}
