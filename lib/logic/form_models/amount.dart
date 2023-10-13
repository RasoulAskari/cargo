// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum AmountValidationError { empty, min, max }

class Amount extends FormzInput<double, AmountValidationError> {
  const Amount.pure() : super.pure(1);
  const Amount.dirty([super.value = 1]) : super.dirty();

  @override
  AmountValidationError? validator(double value) {
    if (value == 0.0) {
      return AmountValidationError.empty;
    } else if (value < 0.0) {
      return AmountValidationError.min;
    }
    return null;
  }
}
