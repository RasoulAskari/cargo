import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/items_list.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void nameChange(String value) {
    final name = FirstName.dirty(value);
    emit(state.copyWith(
      name: name,
    ));
  }

  void passwordChange(String value) {
    final password = CString.dirty(value);
    emit(state.copyWith(
      password: password,
    ));
  }

  void confirmPasswordChange(String value) {
    final password = CString.dirty(value);
    emit(state.copyWith(
      confirmPassword: password,
    ));
  }
}
