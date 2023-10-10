import 'dart:ui';
import 'package:cargo/logic/order/cubit/cubit/order_cubit.dart';
import 'package:cargo/logic/order/cubit/cubit/order_item_cubit.dart';
import 'package:cargo/logic/order/model/order_item.dart';
import 'package:cargo/presentation/widgets/bottom_sheet_style.dart';
import 'package:cargo/presentation/widgets/form/c_text_field.dart';
import 'package:flutter/material.dart';
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
              child: const Text("Add Item detail"))
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
          height: 400,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<OrderItemCubit, OrderItemState>(
                builder: (context, state) {
                  return CTextField(
                    value: state.name.value,
                    setValue: (value) {},
                    hintText: "Item Name",
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CTextField(
                value: "",
                setValue: (value) {},
                hintText: "Type",
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CTextField(
                textInputType: TextInputType.number,
                value: "",
                setValue: (value) {},
                hintText: "Amount",
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CTextField(
                textInputType: TextInputType.number,
                value: "",
                setValue: (value) {},
                hintText: "Weight",
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<OrderCubit>().itemsChange([
                      const MyOrderItme(
                        name: "Mac pro max",
                        type: "carton",
                        count: 1,
                        weight: 1.2,
                      )
                    ]);
                  },
                  child: const Text("Add"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
