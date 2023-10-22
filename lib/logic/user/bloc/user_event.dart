part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends UserEvent {
  final MyUser user;

  const AddUserEvent({required this.user});
}

class FetchUserEvent extends UserEvent {}
