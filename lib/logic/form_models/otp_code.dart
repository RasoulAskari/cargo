import 'package:formz/formz.dart';

enum OtpCodeValidationError { empty }

class OtpCode extends FormzInput<String, OtpCodeValidationError> {
  const OtpCode.pure() : super.pure('');
  const OtpCode.dirty([super.value = '']) : super.dirty();

  @override
  OtpCodeValidationError? validator(String value) {
    if (value.isEmpty) {
      return OtpCodeValidationError.empty;
    }
    return null;
  }
}
