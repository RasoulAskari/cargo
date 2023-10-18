import 'package:cargo/logic/login/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

class UserList extends FormzInput<List<UserModel>?, List<String>> {
  const UserList.pure() : super.pure(null);
  const UserList.dirty(List<UserModel> value) : super.dirty(value);

  @override
  List<String>? validator(List<UserModel>? value) {
    if (value == null || value.isEmpty) {
      return ['The list cannot be empty.'];
    }
    // Add more custom validation logic as needed.
    return null;
  }
}
