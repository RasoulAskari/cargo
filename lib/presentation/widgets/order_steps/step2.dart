import 'package:cargo/logic/form_models/phone_no.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/presentation/widgets/form/c_phone_field.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Step2 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step2({super.key, required this.next, required this.prev});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  PhoneNo phoneNo = const PhoneNo.pure();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        children: [
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                  value: state.receiverName.value,
                  hintText: "Name",
                  setValue: (value) {
                    context.read<OrderCubit>().rNameChange(value);
                  });
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CPhoneField(
                hintText: "Phone Num",
                setValue: (value) {
                  context.read<OrderCubit>().rPhoneNumberChange(value);
                },
                setValid: () {},
                value: state.receiverPhoneNo.value,
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.typeReceiver.value,
                hintText: "Type of Receiver",
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
                  value: state.country.value,
                  hintText: "Country",
                  setValue: () {});
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                  value: state.city.value, hintText: "City", setValue: () {});
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CTextField(
                value: state.address.value,
                hintText: "Address",
                setValue: () {},
                maxlines: 3,
              );
            },
          ),
        ],
      ),
    );
  }
}
