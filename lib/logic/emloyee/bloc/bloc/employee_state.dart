part of 'all_notifications_bloc.dart';


class AllNotificationsState extends Equatable {
  const AllNotificationsState({
    this.notifications = const [],
  });

  final List<NotificationModel> notifications;

  AllNotificationsState copyWith({
    List<NotificationModel>? notifications,
  }) {
    return AllNotificationsState(
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [notifications];
}
