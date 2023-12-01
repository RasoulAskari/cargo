import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/address.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/items_list.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/logic/form_models/number.dart';
import 'package:cargo/logic/order/model/my_order_item.dart';
import 'package:equatable/equatable.dart';
import 'package:cargo/logic/form_models/first_name.dart';
// ignore: depend_on_referenced_packages
import 'package:formz/formz.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void groupChange(int value) {
    final group = Number.dirty(value);
    emit(
      state.copyWith(
        groupNum: group,
      ),
    );
  }

  void cNameChange(String value) {
    final fullname = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerName: fullname,
      ),
    );
  }

  void cFathernameChange(String value) {
    final cFathername = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerFathername: cFathername,
      ),
    );
  }

  void cGrandFathernameChange(String value) {
    final customerGrandFathername = FirstName.dirty(value);
    emit(
      state.copyWith(
        customerGrandFathername: customerGrandFathername,
      ),
    );
  }

  void cTazkiraIdChange(String value) {
    final customerIdCard = CString.dirty(value);
    emit(
      state.copyWith(customerIdCard: customerIdCard),
    );
  }

  void cPhoneNumberChange(value) {
    final cPhoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(customerPhoneNo: cPhoneNumber),
    );
  }

  void rNameChange(String value) {
    final receiverName = FirstName.dirty(value);
    emit(
      state.copyWith(receiverName: receiverName),
    );
  }

  void rPhoneNumberChange(value) {
    final cPhoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(receiverPhoneNo: cPhoneNumber),
    );
  }

  void countryChange(String value) {
    final country = CString.dirty(value);
    emit(
      state.copyWith(country: country),
    );
  }

  void cityChange(String value) {
    final city = CString.dirty(value);
    emit(
      state.copyWith(city: city),
    );
  }

  void typeChange(String value) {
    final type = CString.dirty(value);
    emit(
      state.copyWith(typeReceiver: type),
    );
  }

  void addressChange(String value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(address: address),
    );
  }

  void pricePerKeloChange(double value) {
    final pricePerKelo = Amount.dirty(value);
    emit(
      state.copyWith(pricePerKelo: pricePerKelo),
    );
  }

  void dateChange(String value) {
    final date = MyDate.dirty(value);
    emit(
      state.copyWith(date: date),
    );
    print(state.date);
  }

  void itemsChange(List<MyOrderItme> value) {
    final items = ItemsList.dirty(value);

    emit(
      state.copyWith(items: items),
    );
  }

  void submit() {
    emit(
      state.copyWith(
        items: const ItemsList.pure(),
        customerName: const FirstName.pure(),
        customerFathername: const FirstName.pure(),
        customerGrandFathername: const FirstName.pure(),
        customerIdCard: const CString.pure(),
        customerPhoneNo: const PhoneNo.pure(),
        date: const MyDate.pure(),
        groupNum: const Number.pure(),
        pricePerKelo: const Amount.pure(),
        receiverName: const FirstName.pure(),
        receiverPhoneNo: const PhoneNo.pure(),
        typeReceiver: const CString.pure(),
        country: const CString.pure(),
        city: const CString.pure(),
      ),
    );
  }
}
