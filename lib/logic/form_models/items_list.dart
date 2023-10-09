import 'package:formz/formz.dart';

class ItemsList extends FormzInput<List<Map>?, List<String>> {
  const ItemsList.pure() : super.pure(null);
  const ItemsList.dirty(List<Map> value) : super.dirty(value);

  @override
  List<String>? validator(List<Map>? value) {
    if (value == null || value.isEmpty) {
      return ['The list cannot be empty.'];
    }
    // Add more custom validation logic as needed.
    return null;
  }
}
