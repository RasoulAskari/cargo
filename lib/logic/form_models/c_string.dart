import 'package:formz/formz.dart';

enum CStringValidationError { empty, min, max }

class CString extends FormzInput<String, CStringValidationError> {
  const CString.pure() : super.pure('');
  const CString.dirty([super.value = '']) : super.dirty();

  @override
  CStringValidationError? validator(String value) {
    if (value.isEmpty) {
      return CStringValidationError.empty;
    } else if (value.length < 2) {
      return CStringValidationError.min;
    } else if (value.length > 32) {
      return CStringValidationError.max;
    }
    return null;
  }
}
