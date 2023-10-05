import 'package:flutter/material.dart';

class BottomSheetStyle extends StatelessWidget {
  final List<Widget> children;
  final double? height;
  const BottomSheetStyle({super.key, required this.children, this.height});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: height == null ? 400 : height!,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 7,
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  ...children
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
