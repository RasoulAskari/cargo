import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:cargo/logic/form_models/number.dart';
import 'package:equatable/equatable.dart';

part 'exchange_money_state.dart';

class ExchangeMoneyCubit extends Cubit<ExchangeMoneyState> {
  ExchangeMoneyCubit() : super(ExchangeMoneyInitial());

  void senderNameChange(String value) {
    final sName = FirstName.dirty(value);
    emit(state.copyWith(
      senderName: sName,
    ));
  }

  void receiverFatherNameChange(String value) {
    final sFName = FirstName.dirty(value);
    emit(state.copyWith(
      receiverFathername: sFName,
    ));
  }

  void receiverNameChange(String value) {
    final rName = FirstName.dirty(value);
    emit(state.copyWith(
      receiverName: rName,
    ));
  }

  void amountChange(double value) {
    final sAmount = Amount.dirty(value);
    emit(state.copyWith(
      amount: sAmount,
    ));
  }

  void currencyChange(String value) {
    final sCurrency = CString.dirty(value);
    emit(state.copyWith(
      currency: sCurrency,
    ));
  }

  void provinceChange(String value) {
    final sProvince = CString.dirty(value);
    emit(state.copyWith(
      province: sProvince,
    ));
  }

  void exchangeIdChange(String value) {
    final sExchangeId = CString.dirty(value);
    emit(state.copyWith(
      exchangeId: sExchangeId,
    ));
  }

  void receiverIdNoChange(int value) {
    final sExchangeId = Number.dirty(value);
    emit(state.copyWith(
      receiverIdNo: sExchangeId,
    ));
  }

  void dateChange(String value) {
    final date = MyDate.dirty(value);
    emit(state.copyWith(
      date: date,
    ));
  }

  void phoneNumberChange(value) {
    final phoneNumber = PhoneNo.dirty(value);
    emit(
      state.copyWith(phoneNumber: phoneNumber),
    );
  }

  void submit() {
    emit(
      state.copyWith(
        phoneNumber: const PhoneNo.pure(),
        amount: const Amount.pure(),
        date: const MyDate.pure(),
        currency: const CString.pure(),
        exchangeId: const CString.pure(),
        receiverIdNo: const Number.pure(),
        receiverName: const FirstName.pure(),
        receiverFathername: const FirstName.pure(),
        province: const CString.pure(),
      ),
    );
  }
}
