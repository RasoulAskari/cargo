import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/emloyee/cubit/employee_cubit.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        children: [
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.currentAddress.isNotValid
                    ? getAddressError(state.currentAddress.error, context,
                        AppLocalizations.of(context)!.address)
                    : null,
                value: state.currentAddress.value,
                hintText: AppLocalizations.of(context)?.address,
                setValue: (value) {
                  context.read<EmployeeCubit>().currentAddressChange(value);
                },
                maxlines: 3,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.premenentAddress.isNotValid
                    ? getAddressError(state.premenentAddress.error, context,
                        AppLocalizations.of(context)!.address)
                    : null,
                value: state.premenentAddress.value,
                hintText: AppLocalizations.of(context)?.address,
                setValue: (value) {
                  context.read<EmployeeCubit>().premenentAddressChange(value);
                },
                maxlines: 3,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.typeReceiver.isNotValid
                    ? getCStringError(state.typeReceiver.error, context,
                        AppLocalizations.of(context)!.reciver_type)
                    : null,
                value: state.typeReceiver.value,
                hintText: AppLocalizations.of(context)!.reciver_type,
                setValue: (value) {
                  context.read<EmployeeCubit>().typeChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.country.isNotValid
                    ? getCStringError(state.country.error, context,
                        AppLocalizations.of(context)!.country)
                    : null,
                value: state.country.value,
                hintText: AppLocalizations.of(context)?.country,
                setValue: (value) {
                  context.read<EmployeeCubit>().countryChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                  errorText: state.city.isNotValid
                      ? getCStringError(state.city.error, context,
                          AppLocalizations.of(context)!.city)
                      : null,
                  value: state.city.value,
                  hintText: AppLocalizations.of(context)?.city,
                  setValue: (value) {
                    context.read<EmployeeCubit>().cityChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.address.isNotValid
                    ? getAddressError(state.address.error, context,
                        AppLocalizations.of(context)!.address)
                    : null,
                value: state.address.value,
                hintText: AppLocalizations.of(context)?.address,
                setValue: (value) {
                  context.read<EmployeeCubit>().addressChange(value);
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
