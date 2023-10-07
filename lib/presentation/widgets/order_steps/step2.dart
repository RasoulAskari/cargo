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
          CPhoneField(
              hintText: "Phone Num",
              setValue: (value) {},
              setValid: () {},
              value: phoneNo.value),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "Type of Receiver", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "Country", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(value: "", hintText: "City", setValue: () {}),
          const SizedBox(height: 30),
          CTextField(
            value: "",
            hintText: "Address",
            setValue: () {},
            maxlines: 3,
          ),
        ],
      ),
    );
  }
}
