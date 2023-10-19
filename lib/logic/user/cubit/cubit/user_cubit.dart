import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/email.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/user_list.dart';
import 'package:cargo/logic/login/user_model.dart';
import 'package:cargo/logic/user/model/role_model.dart';
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

  void emailChange(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
    ));
  }

  void roleChange(String value) {
    final role = CString.dirty(value);
    emit(state.copyWith(
      role: role,
    ));
  }

  void itemsChange(List<RoleModel> value) {
    final items = UserList.dirty(value);

    emit(
      state.copyWith(premissions: items),
    );
  }
}
