import 'package:formz/formz.dart';

enum BirthDateValidationError { empty }

class BirthDate extends FormzInput<String, BirthDateValidationError> {
  const BirthDate.pure() : super.pure('');
  const BirthDate.dirty([super.value = '']) : super.dirty();

  @override
  BirthDateValidationError? validator(String value) {
    if (value.isEmpty) {
      return BirthDateValidationError.empty;
    }
    return null;
  }
}
