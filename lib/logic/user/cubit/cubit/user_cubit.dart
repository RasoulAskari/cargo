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

  void permissionChange(List<RoleModel?> value) {
    List<String> data = [];

    // final da = value.map((e) {
    //   return e.map((e1) {
    //     return e1?.action.map((e2) {
    //       return e2;
    //     }).toList();
    //   }).toList();
    // }).toList();

    // ignore: avoid_function_literals_in_foreach_calls
    // value.forEach(
    //   // ignore: avoid_function_literals_in_foreach_calls
    //   (element) => element.forEach((element2) {
    //     element2?.action.forEach((element3) {
    //       data.add(element3);
    //     });
    //   }),
    // );
  }
}
