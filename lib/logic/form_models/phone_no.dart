// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

enum PhoneNoValidationError { empty }

class PhoneNo extends FormzInput<PhoneNumber, PhoneNoValidationError> {
  const PhoneNo.pure() : super.pure(const PhoneNumber());
  const PhoneNo.dirty([super.value = const PhoneNumber()]) : super.dirty();

  @override
  PhoneNoValidationError? validator(PhoneNumber value) {
    if (value.phoneNumber.isEmpty) return PhoneNoValidationError.empty;
    return null;
  }
}
