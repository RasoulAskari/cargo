import 'package:cargo/logic/order/model/order_item.dart';
import 'package:formz/formz.dart';

class ItemsList extends FormzInput<List<MyOrderItme>?, List<String>> {
  const ItemsList.pure() : super.pure(null);
  const ItemsList.dirty(List<MyOrderItme> value) : super.dirty(value);

  @override
  List<String>? validator(List<MyOrderItme>? value) {
    if (value == null || value.isEmpty) {
      return ['The list cannot be empty.'];
    }
    // Add more custom validation logic as needed.
    return null;
  }
}
