import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step2 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step2({super.key, required this.next, required this.prev});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        children: [
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                  errorText: state.receiverName.isNotValid
                      ? getFirstnameError(
                          state.receiverName.error,
                          context,
                          AppLocalizations.of(context)!.firstname,
                        )
                      : null,
                  value: state.receiverName.value,
                  hintText: AppLocalizations.of(context)?.firstname,
                  setValue: (value) {
                    context.read<OrderCubit>().rNameChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: AppLocalizations.of(context)!.phone_num,
                setValue: (value) {
                  context.read<OrderCubit>().rPhoneNumberChange(value);
                },
                setValid: (bool? isValidPassed) {
                  setState(() {
                    isValid = isValidPassed ?? false;
                  });
                },
                value: state.receiverPhoneNo.value,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.typeReceiver.isNotValid
                    ? getCStringError(state.typeReceiver.error, context,
                        AppLocalizations.of(context)!.reciver_type)
                    : null,
                value: state.typeReceiver.value,
                hintText: AppLocalizations.of(context)!.reciver_type,
                setValue: (value) {
                  context.read<OrderCubit>().typeChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.country.isNotValid
                    ? getCStringError(state.country.error, context,
                        AppLocalizations.of(context)!.country)
                    : null,
                value: state.country.value,
                hintText: AppLocalizations.of(context)?.country,
                setValue: (value) {
                  context.read<OrderCubit>().countryChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                  errorText: state.city.isNotValid
                      ? getCStringError(state.city.error, context,
                          AppLocalizations.of(context)!.city)
                      : null,
                  value: state.city.value,
                  hintText: AppLocalizations.of(context)?.city,
                  setValue: (value) {
                    context.read<OrderCubit>().cityChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.address.isNotValid
                    ? getAddressError(state.address.error, context,
                        AppLocalizations.of(context)!.address)
                    : null,
                value: state.address.value,
                hintText: AppLocalizations.of(context)?.address,
                setValue: (value) {
                  context.read<OrderCubit>().addressChange(value);
                },
                maxlines: 3,
              );
            },
          ),
        ],
      ),
    );
  }
}
