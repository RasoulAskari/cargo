import 'package:cargo/logic/user/model/user_privileges.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

class Privilege extends FormzInput<UserPrivileage?, List<String>> {
  const Privilege.pure() : super.pure(null);
  const Privilege.dirty(UserPrivileage value) : super.dirty(value);

  @override
  List<String>? validator(UserPrivileage? value) {
    if (value == null) {
      return ['The list cannot be empty.'];
    }
    return null;
  }
}
