import 'package:formz/formz.dart';

enum AmountValidationError { empty, min, max }

class Amount extends FormzInput<int, AmountValidationError> {
  const Amount.pure() : super.pure(1);
  const Amount.dirty([super.value = 1]) : super.dirty();

  @override
  AmountValidationError? validator(int value) {
    if (value == null) {
      return AmountValidationError.empty;
    } else if (value < 0) {
      return AmountValidationError.min;
    }
    return null;
  }
}
