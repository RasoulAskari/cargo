import 'package:formz/formz.dart';

enum NumberValidationError { empty, min, max }

class Number extends FormzInput<int, NumberValidationError> {
  const Number.pure() : super.pure(1);
  const Number.dirty([super.value = 1]) : super.dirty();

  @override
  NumberValidationError? validator(int value) {
    if (value == 0) {
      return NumberValidationError.empty;
    } else if (value < 0) {
      return NumberValidationError.min;
    }
    return null;
  }
}
