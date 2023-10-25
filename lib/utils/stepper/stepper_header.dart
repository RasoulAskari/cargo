import 'dart:ui';

import 'package:flutter/material.dart';

class StepperHeader extends StatefulWidget {
  final Function prev;
  final String title;
  final String? backText;
  final int step;
  final int stepAmount;

  const StepperHeader({
    super.key,
    required this.prev,
    required this.title,
    required this.backText,
    required this.step,
    required this.stepAmount,
  });

  @override
  State<StepperHeader> createState() => _StepperHeaderState();
}

class _StepperHeaderState extends State<StepperHeader> {
  // ignore: deprecated_member_use
  final d = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: d, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  widget.prev();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text(
                  "${widget.backText}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int x = 1; x <= widget.stepAmount; x++) ...[
                      widget.step == x || widget.step > x
                          ? Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 12,
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const Icon(
                                Icons.circle_outlined,
                                color: Colors.white,
                                size: 12,
                              ),
                            )
                    ],
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
