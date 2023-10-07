import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_date_picker.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          CTextField(value: "", hintText: "Group Number", setValue: () {}),
          const SizedBox(height: 30),
          CDatePicker(
            setValue: (value) {},
            hintText: "Date",
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.customerName.value,
                hintText: "Name",
                setValue: (value) {
                  context.read<OrderCubit>().cNameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.customerFathername.value,
                hintText: "Fathername",
                setValue: (value) {
                  context.read<OrderCubit>().cFathernameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.customerGrandFathername.value,
                hintText: "Grand Fathername",
                setValue: (value) {
                  context.read<OrderCubit>().cGrandFathernameChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.customerIdCard.value,
                hintText: "ID Card Number",
                setValue: (value) {
                  context.read<OrderCubit>().cTazkiraIdChange(value);
                },
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: "Phone Num",
                setValue: (value) {
                  context.read<OrderCubit>().cPhoneNumberChange(value);
                },
                setValid: () {},
                value: state.customerPhoneNo.value,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                hintText: "Price",
                value: state.pricePerKelo.value.toString(),
                setValue: (value) {},
                textInputType: TextInputType.number,
              );
            },
          ),
        ],
      ),
    );
  }
}
