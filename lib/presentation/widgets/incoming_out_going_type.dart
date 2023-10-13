// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum IncomingOutGoingTypeValidationError { empty }

class IncomingOutGoingType
    extends FormzInput<String, IncomingOutGoingTypeValidationError> {
  const IncomingOutGoingType.pure() : super.pure('');
  const IncomingOutGoingType.dirty([super.value = '']) : super.dirty();

  @override
  IncomingOutGoingTypeValidationError? validator(String value) {
    if (value.isEmpty) {
      return IncomingOutGoingTypeValidationError.empty;
    }
    return null;
  }
}
