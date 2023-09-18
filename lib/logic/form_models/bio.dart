import 'package:formz/formz.dart';

enum BioValidationError { max, invalid }

class Bio extends FormzInput<String, BioValidationError> {
  const Bio.pure() : super.pure('');
  const Bio.dirty([super.value = '']) : super.dirty();

  @override
  BioValidationError? validator(String value) {
    if (value.length > 100) {
      return BioValidationError.max;
    }
    return null;
  }
}
