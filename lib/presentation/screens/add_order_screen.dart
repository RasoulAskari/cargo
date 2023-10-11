import 'dart:convert';

import 'package:cargo/constants/routes.dart';
import 'package:cargo/logic/helpers/global_helpers.dart';
import 'package:cargo/logic/order/bloc/bloc/order_bloc.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/logic/order/model/my_order_item.dart';
import 'package:cargo/logic/order/model/order_model.dart';
import 'package:cargo/presentation/widgets/order_steps/step1.dart';
import 'package:cargo/presentation/widgets/order_steps/step2.dart';
import 'package:cargo/presentation/widgets/order_steps/step3.dart';
import 'package:cargo/utils/stepper/c_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  late http.Client httpClient;

  var step = 1;
  bool loading = false;

  next(steps) {
    setState(() {
      step = step + 1;
    });
  }

  prev(steps) {
    if (step == 1) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      step = step - 1;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List steps = [
      {
        'title': "Info About The Person\nwhom Order ",
        'step': Step1(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
      {
        'title': "Info About The Receiver",
        'step': Step2(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
      {
        'title': "Info About Item",
        'step': Step3(
          next: next,
          prev: prev,
        ),
        'validate': true
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CStepper(
        stepAmount: 3,
        steps: steps,
        step: step,
        next: () {
          next(steps);
        },
        onSubmit: () async {
          final state = context.read<OrderCubit>().state;

          OrderModel order = OrderModel(
            items: state.items.value!
                .map((e) => MyOrderItme(
                    name: e.name,
                    type: e.type,
                    count: e.count,
                    weight: e.weight))
                .toList(),
            id: 1,
            date: state.date.value,
            cardId: 1,
            customerName: state.customerName.value,
            groupNumber: state.groupNum.value,
            fatherName: state.customerFathername.value,
            grandFatherName: state.customerFathername.value,
            tazkiraId: state.customerIdCard.value,
            customerPhone: state.customerPhoneNo.value.phoneNumber,
            receiverName: state.receiverName.value,
            receiverPhone: state.receiverPhoneNo.value.phoneNumber,
            country: state.country.value,
            city: state.city.value,
            address: state.address.value,
            delivaryType: state.typeReceiver.value,
          );
          context.read<OrderBloc>().add(AddOrderEvent(order: order));
          Navigator.of(context).pushReplacementNamed(ordersScreen);
        },
        prev: () {
          prev(steps);
        },
        loading: loading,
      ),
    );
  }
}
