part of 'salary_bloc.dart';

enum SalaryStatus { initial, success, failure }

class SalaryState extends Equatable {
  const SalaryState({
    this.status = SalaryStatus.initial,
    this.salary = const <SalaryModel>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final SalaryStatus status;
  final List<SalaryModel> salary;
  final int page;
  final bool hasReachedMax;

  SalaryState copyWith({
    SalaryStatus? status,
    List<SalaryModel>? salary,
    bool? hasReachedMax,
    int? page,
  }) {
    return SalaryState(
      status: status ?? this.status,
      salary: salary ?? this.salary,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''SalaryState { status: $status, hasReachedMax: $hasReachedMax, salary: ${salary.length} }''';
  }

  @override
  List<Object> get props => [status, salary, hasReachedMax, page];
}
