import 'package:formz/formz.dart';

enum EmailValidationError { empty, min, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (!emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    } else if (value.length < 10) {
      return EmailValidationError.min;
    }
    return null;
  }
}
