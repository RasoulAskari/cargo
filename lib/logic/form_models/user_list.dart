import 'package:cargo/logic/login/user_model.dart';
import 'package:cargo/logic/user/model/role_model.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

class UserList extends FormzInput<List<RoleModel>?, List<String>> {
  const UserList.pure() : super.pure(null);
  const UserList.dirty(List<RoleModel> value) : super.dirty(value);

  @override
  List<String>? validator(List<RoleModel>? value) {
    if (value == null || value.isEmpty) {
      return ['The list cannot be empty.'];
    }
    return null;
  }
}
