part of 'user_bloc.dart';

enum UserStatus { initial, success, failure }

const _postLimit = 10;

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const <MyUser>[],
    this.hasReachedMax = false,
    this.page = 0,
  });

  final UserStatus status;
  final List<MyUser> users;
  final int page;
  final bool hasReachedMax;

  UserState copyWith({
    UserStatus? status,
    List<MyUser>? users,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''userstate { status: $status, hasReachedMax: $hasReachedMax, users: ${users.length} }''';
  }

  @override
  List<Object> get props => [status, users, hasReachedMax, page];
}
