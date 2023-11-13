import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/emloyee/cubit/employee_cubit.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/input_label.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        children: [
          InputLabel(label: AppLocalizations.of(context)!.current_address),
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
          InputLabel(label: AppLocalizations.of(context)!.premenent_address),
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
              return CDatePicker(
                value: state.startDate.value != ""
                    ? DateTime.parse(state.startDate.value)
                    : DateTime.now(),
                setValue: (value) {
                  context
                      .read<EmployeeCubit>()
                      .startDateChange(value.toString());
                },
                hintText: AppLocalizations.of(context)?.date,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CDatePicker(
                value: state.endDate.value != ""
                    ? DateTime.parse(state.endDate.value)
                    : DateTime.now(),
                setValue: (value) {
                  context.read<EmployeeCubit>().endDateChange(value.toString());
                },
                hintText: AppLocalizations.of(context)?.date,
              );
            },
          ),
        ],
      ),
    );
  }
}
