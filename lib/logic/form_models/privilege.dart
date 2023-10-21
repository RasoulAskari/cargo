import 'package:cargo/logic/user/model/role_model.dart';
import 'package:cargo/logic/user/model/user_privileges.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

class Privilege extends FormzInput<List<UserPrivileage>?, List<String>> {
  const Privilege.pure() : super.pure(null);
  const Privilege.dirty(List<UserPrivileage> value) : super.dirty(value);

  @override
  List<String>? validator(List<UserPrivileage>? value) {
    if (value == null || value.isEmpty) {
      return ['The list cannot be empty.'];
    }
    return null;
  }
}
