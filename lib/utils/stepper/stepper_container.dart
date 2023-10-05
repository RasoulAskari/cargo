import 'package:flutter/material.dart';

class StepContainer extends StatelessWidget {
  final Widget child;
  final Function next;
  final Function onSubmit;
  final int step;
  final int stepsLength;
  final bool loading;
  const StepContainer({
    super.key,
    required this.child,
    required this.next,
    required this.onSubmit,
    required this.step,
    required this.stepsLength,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 185,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewInsets.bottom -
                        280,
                    child: SingleChildScrollView(child: child),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 0, top: 20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(500.0),
                      onTap: () {
                        if (step == stepsLength) {
                          onSubmit();
                        } else {
                          next();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(500.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: loading
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                step == stepsLength
                                    ? Icons.check
                                    : Icons.arrow_forward,
                                size: 30.0,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
