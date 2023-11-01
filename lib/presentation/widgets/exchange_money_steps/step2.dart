import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:cargo/logic/exchange_money/cubit/cubit/exchange_money_cubit.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step2 extends StatefulWidget {
  final Function prev;
  final Function next;
  const Step2({super.key, required this.prev, required this.next});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  PhoneNo phoneNo = const PhoneNo.pure();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        children: [
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                  errorText: state.receiverName.isNotValid
                      ? getFirstnameError(state.receiverName.error, context)
                      : null,
                  value: state.receiverName.value,
                  hintText: AppLocalizations.of(context)?.receiver_name,
                  setValue: (value) {
                    context
                        .read<ExchangeMoneyCubit>()
                        .receiverNameChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                  value: state.receiverFathername.value,
                  hintText: AppLocalizations.of(context)?.receiver_father_name,
                  setValue: (value) {
                    context
                        .read<ExchangeMoneyCubit>()
                        .receiverFatherNameChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                textInputType: TextInputType.number,
                hintText: AppLocalizations.of(context)?.receiver_id,
                value: state.receiverIdNo.value.toString(),
                setValue: (value) {
                  int val;
                  if (value == "") {
                    val = 1;
                  } else {
                    val = int.parse(value);
                  }

                  context.read<ExchangeMoneyCubit>().receiverIdNoChange(val);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: AppLocalizations.of(context)!.phone_num,
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().phoneNumberChange(value);
                },
                setValid: (bool? isValidPassed) {
                  setState(() {
                    isValid = isValidPassed ?? false;
                  });
                },
                value: state.phoneNumber.value,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<ExchangeMoneyCubit, ExchangeMoneyState>(
            builder: (context, state) {
              return CTextField(
                hintText: AppLocalizations.of(context)?.province,
                value: state.province.value,
                setValue: (value) {
                  context.read<ExchangeMoneyCubit>().provinceChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
