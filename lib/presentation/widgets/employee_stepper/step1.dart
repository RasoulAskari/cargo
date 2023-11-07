import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/emloyee/cubit/employee_cubit.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Step1 extends StatefulWidget {
  final Function prev;
  final Function next;
  const Step1({super.key, required this.prev, required this.next});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.firstname.isNotValid
                    ? getFirstnameError(state.firstname.error, context,
                        AppLocalizations.of(context)!.firstname)
                    : null,
                value: state.firstname.value,
                hintText: AppLocalizations.of(context)?.firstname,
                setValue: (value) {
                  context.read<EmployeeCubit>().firstnameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerFathername.isNotValid
                    ? getFirstnameError(state.customerFathername.error, context,
                        AppLocalizations.of(context)!.father_name)
                    : null,
                value: state.customerFathername.value,
                hintText: AppLocalizations.of(context)?.father_name,
                setValue: (value) {
                  context.read<EmployeeCubit>().cFathernameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
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
                  context.read<EmployeeCubit>().cGrandFathernameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CTextField(
                errorText: state.customerIdCard.isNotValid
                    ? getCStringError(state.customerIdCard.error, context,
                        AppLocalizations.of(context)!.id_card_num)
                    : null,
                value: state.customerIdCard.value,
                hintText: AppLocalizations.of(context)!.id_card_num,
                setValue: (value) {
                  context.read<EmployeeCubit>().cTazkiraIdChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: AppLocalizations.of(context)!.phone_num,
                setValue: (value) {
                  context.read<EmployeeCubit>().cPhoneNumberChange(value);
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
          BlocBuilder<EmployeeCubit, EmployeeState>(
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

                  context.read<EmployeeCubit>().pricePerKeloChange(val);
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
