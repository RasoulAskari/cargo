// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum AddressValidationError { empty, min, max }

class Address extends FormzInput<String, AddressValidationError> {
  const Address.pure() : super.pure('');
  const Address.dirty([super.value = '']) : super.dirty();

  @override
  AddressValidationError? validator(String value) {
    if (value.isEmpty) {
      return AddressValidationError.empty;
    } else if (value.length < 8) {
      return AddressValidationError.min;
    } else if (value.length > 200) {
      return AddressValidationError.min;
    }
    return null;
  }
}
