import 'package:formz/formz.dart';

enum UserNameValidationError { empty, min, max, invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
  const UserName.pure() : super.pure('');
  const UserName.dirty([super.value = '']) : super.dirty();

  @override
  UserNameValidationError? validator(String value) {
    RegExp regExp = RegExp(
      r'^[a-zA-Z0-9_@]+$',
      caseSensitive: false,
      multiLine: false,
    );
    if (value.isEmpty) {
      return UserNameValidationError.empty;
    } else if (value.length < 6) {
      return UserNameValidationError.min;
    } else if (value.length > 32) {
      return UserNameValidationError.max;
    } else if (!regExp.hasMatch(value)) {
      return UserNameValidationError.invalid;
    }
    return null;
  }
}
