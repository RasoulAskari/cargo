import 'package:flutter/material.dart';

class BrandBg extends StatelessWidget {
  const BrandBg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 5 * 3,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5 * 2,
              color: Colors.black12,
            )
          ],
        ),
      ),
    );
  }
}
