// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum CountryModelValidationError { empty }

class CountryModel extends FormzInput<String, CountryModelValidationError> {
  const CountryModel.pure() : super.pure('');
  const CountryModel.dirty([super.value = '']) : super.dirty();

  @override
  CountryModelValidationError? validator(String value) {
    if (value.isEmpty) {
      return CountryModelValidationError.empty;
    }
    return null;
  }
}
