import 'dart:ui';
import 'package:cargo/config/localization.dart';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/logic/order/cubit/cubit/order_item_cubit.dart';
import 'package:cargo/logic/order/model/my_order_item.dart';
import 'package:cargo/presentation/widgets/bottom_sheet_style.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:cargo/presentation/widgets/order_staff.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class Step3 extends StatefulWidget {
  final Function next;
  final Function prev;
  const Step3({super.key, required this.next, required this.prev});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _addItemDetail(context);
            },
            child: Text(AppLocalizations.of(context)!.add_order_detail),
          ),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return state.items.value == null
                  ? Container()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 6 * 4,
                      child: ListView.builder(
                          itemCount: state.items.value?.length,
                          itemBuilder: (context, index) {
                            return OrderStaff(
                              order: state.items.value![index],
                            );
                          }),
                    );
            },
          )
        ],
      ),
    );
  }

  void _addItemDetail(BuildContext context) {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: BottomSheetStyle(
          height: 450,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<OrderItemCubit, OrderItemState>(
                builder: (context, state) {
                  return CTextField(
                    value: state.name.value,
                    setValue: (value) {
                      context.read<OrderItemCubit>().nameChange(value);
                    },
                    hintText: "Item Name",
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<OrderItemCubit, OrderItemState>(
                builder: (context, state) {
                  return CTextField(
                    value: state.type.value,
                    setValue: (value) {
                      context.read<OrderItemCubit>().typeChange(value);
                    },
                    hintText: "Type",
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<OrderItemCubit, OrderItemState>(
                builder: (context, state) {
                  return CTextField(
                    textInputType: TextInputType.number,
                    value: state.type.value,
                    setValue: (value) {
                      int val;
                      if (value == "") {
                        val = 1;
                      } else {
                        val = int.parse(value);
                      }

                      context.read<OrderItemCubit>().countChange(val);
                    },
                    hintText: "Amount",
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<OrderItemCubit, OrderItemState>(
                builder: (context, state) {
                  return CTextField(
                    textInputType: TextInputType.number,
                    value: state.weight.value.toString(),
                    setValue: (value) {
                      double val;
                      if (value == "") {
                        val = 1;
                      } else {
                        val = double.parse(value);
                      }

                      context.read<OrderItemCubit>().weightChange(val);
                    },
                    hintText: "Weight",
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<OrderItemCubit, OrderItemState>(
              builder: (context, state) {
                return BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, orderState) {
                    List<MyOrderItme>? orders = [];
                    List<MyOrderItme>? data = orderState.items.value;

                    orders = data == null ? [] : data.map((e) => e).toList();
                    orders.add(MyOrderItme(
                      name: state.name.value,
                      type: state.name.value,
                      count: state.count.value,
                      weight: state.weight.value,
                    ));
                    return ElevatedButton(
                      onPressed: () {
                        context.read<OrderCubit>().itemsChange(orders!);
                        context.read<OrderItemCubit>().resetOrderItem();

                        Navigator.of(context).pop();
                      },
                      child: const Text("Add"),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
