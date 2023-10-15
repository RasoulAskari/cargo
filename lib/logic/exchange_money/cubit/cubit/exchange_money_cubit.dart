import 'package:bloc/bloc.dart';
import 'package:cargo/logic/form_models/amount.dart';
import 'package:cargo/logic/form_models/c_string.dart';
import 'package:cargo/logic/form_models/first_name.dart';
import 'package:cargo/logic/form_models/models.dart';
import 'package:equatable/equatable.dart';

part 'exchange_money_state.dart';

class ExchangeMoneyCubit extends Cubit<ExchangeMoneyState> {
  ExchangeMoneyCubit() : super(ExchangeMoneyInitial());

  void senderNameChange(String name) {
    final sName = FirstName.dirty(name);
    emit(state.copyWith(
      senderName: sName,
    ));
  }

  void receiverFatherNameChange(String name) {
    final sFName = FirstName.dirty(name);
    emit(state.copyWith(
      receiverFathername: sFName,
    ));
  }

  void amountChange(double amount) {
    final sAmount = Amount.dirty(amount);
    emit(state.copyWith(
      amount: sAmount,
    ));
  }
}
