// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, min, max }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 8) {
      return PasswordValidationError.min;
    } else if (value.length > 16) {
      return PasswordValidationError.max;
    }
    return null;
  }
}
