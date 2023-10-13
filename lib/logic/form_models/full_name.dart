// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum FullNameValidationError { empty, min, max }

class FullName extends FormzInput<String, FullNameValidationError> {
  const FullName.pure() : super.pure('');
  const FullName.dirty([super.value = '']) : super.dirty();

  @override
  FullNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return FullNameValidationError.empty;
    } else if (value.length < 6) {
      return FullNameValidationError.min;
    } else if (value.length > 32) {
      return FullNameValidationError.max;
    }
    return null;
  }
}
