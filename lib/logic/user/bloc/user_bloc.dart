import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:cargo/logic/login/user_model.dart';
import 'package:cargo/logic/user/model/my_user.dart';
import 'package:cargo/logic/user/model/role_model.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
