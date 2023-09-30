import 'package:formz/formz.dart';

enum AmountValidationError { empty, min, max }

class Amount extends FormzInput<String, AmountValidationError> {
  const Amount.pure() : super.pure('');
  const Amount.dirty([super.value = '']) : super.dirty();

  @override
  AmountValidationError? validator(String value) {
    if (value.isEmpty) {
      return AmountValidationError.empty;
    } else if (value.length < 6) {
      return AmountValidationError.min;
    } else if (value.length > 32) {
      return AmountValidationError.max;
    }
    return null;
  }
}
