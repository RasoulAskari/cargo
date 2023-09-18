import 'package:formz/formz.dart';

enum StateModelValidationError { empty }

class StateModel extends FormzInput<String, StateModelValidationError> {
  const StateModel.pure() : super.pure('');
  const StateModel.dirty([super.value = '']) : super.dirty();

  @override
  StateModelValidationError? validator(String value) {
    if (value.isEmpty) {
      return StateModelValidationError.empty;
    }
    return null;
  }
}
