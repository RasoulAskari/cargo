// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum FirstNameValidationError { empty, min, max }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([super.value = '']) : super.dirty();

  @override
  FirstNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return FirstNameValidationError.empty;
    } else if (value.length < 3) {
      return FirstNameValidationError.min;
    } else if (value.length > 16) {
      return FirstNameValidationError.max;
    }
    return null;
  }
}
