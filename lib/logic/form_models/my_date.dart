// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

enum MyDateValidationError { empty }

class MyDate extends FormzInput<String, MyDateValidationError> {
  const MyDate.pure() : super.pure('');
  const MyDate.dirty([super.value = '']) : super.dirty();

  @override
  MyDateValidationError? validator(String value) {
    if (value.isEmpty) {
      return MyDateValidationError.empty;
    }
    return null;
  }
}
