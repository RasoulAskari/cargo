import 'package:formz/formz.dart';

enum FirstNameValidationError { empty, min, max }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([super.value = '']) : super.dirty();

  @override
  FirstNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return FirstNameValidationError.empty;
    } else if (value.length < 6) {
      return FirstNameValidationError.min;
    } else if (value.length > 32) {
      return FirstNameValidationError.max;
    }
    return null;
  }
}
