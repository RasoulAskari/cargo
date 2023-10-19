import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step2({super.key, required this.next, required this.prev});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return CDatePicker(
                value: state.date.value != ""
                    ? DateTime.parse(state.date.value)
                    : DateTime.now(),
                setValue: (value) {
                  context.read<OrderCubit>().dateChange(value.toString());
                },
                hintText: "Date",
              );
            },
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
                hintText: "Price",
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
