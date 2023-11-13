import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step1 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step1({super.key, required this.next, required this.prev});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  PhoneNo phoneNo = const PhoneNo.pure();

  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        children: [
          InputLabel(label: AppLocalizations.of(context)!.date),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CDatePicker(
                value: state.date.value != ""
                    ? DateTime.parse(state.date.value)
                    : DateTime.now(),
                setValue: (value) {
                  context.read<OrderCubit>().dateChange(value.toString());
                },
                hintText: AppLocalizations.of(context)?.date,
              );
            },
          ),
          InputLabel(label: AppLocalizations.of(context)!.firstname),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerName.isNotValid
                    ? getFirstnameError(state.customerName.error, context,
                        AppLocalizations.of(context)!.firstname)
                    : null,
                value: state.customerName.value,
                hintText: AppLocalizations.of(context)?.firstname,
                setValue: (value) {
                  context.read<OrderCubit>().cNameChange(value);
                },
              );
            },
          ),
          InputLabel(label: AppLocalizations.of(context)!.father_name),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerFathername.isNotValid
                    ? getFirstnameError(state.customerFathername.error, context,
                        AppLocalizations.of(context)!.father_name)
                    : null,
                value: state.customerFathername.value,
                hintText: AppLocalizations.of(context)?.father_name,
                setValue: (value) {
                  context.read<OrderCubit>().cFathernameChange(value);
                },
              );
            },
          ),
          InputLabel(label: AppLocalizations.of(context)!.grand_father_name),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerGrandFathername.isNotValid
                    ? getFirstnameError(
                        state.customerGrandFathername.error,
                        context,
                        AppLocalizations.of(context)!.grand_father_name)
                    : null,
                value: state.customerGrandFathername.value,
                hintText: AppLocalizations.of(context)?.grand_father_name,
                setValue: (value) {
                  context.read<OrderCubit>().cGrandFathernameChange(value);
                },
              );
            },
          ),
          InputLabel(label: AppLocalizations.of(context)!.id_card_num),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerIdCard.isNotValid
                    ? getCStringError(state.customerIdCard.error, context,
                        AppLocalizations.of(context)!.id_card_num)
                    : null,
                value: state.customerIdCard.value,
                hintText: AppLocalizations.of(context)!.id_card_num,
                setValue: (value) {
                  context.read<OrderCubit>().cTazkiraIdChange(value);
                },
              );
            },
          ),
          InputLabel(label: AppLocalizations.of(context)!.phone_num),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: AppLocalizations.of(context)!.phone_num,
                setValue: (value) {
                  context.read<OrderCubit>().cPhoneNumberChange(value);
                },
                setValid: (bool? isValidPassed) {
                  setState(() {
                    isValid = isValidPassed ?? false;
                  });
                },
                value: state.customerPhoneNo.value,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.pricePerKelo.isNotValid
                    ? getAmountError(state.pricePerKelo.error, context,
                        AppLocalizations.of(context)!.price)
                    : null,
                hintText: AppLocalizations.of(context)!.price,
                value: state.pricePerKelo.value.toString(),
                setValue: (value) {
                  double val;
                  if (value == "") {
                    val = 1;
                  } else {
                    val = double.parse(value);
                  }

                  context.read<OrderCubit>().pricePerKeloChange(val);
                },
                textInputType: TextInputType.number,
              );
            },
          ),
        ],
      ),
    );
  }
}
