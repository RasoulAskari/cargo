import 'package:cargo/utils/stepper/bard_bg.dart';
import 'package:flutter/widgets.dart';

class CStepper extends StatefulWidget {
  final List steps;
  final int step;
  final Function next;
  final Function prev;
  final Function? onSubmit;
  final int stepAmount;
  final bool loading;
  const CStepper({
    super.key,
    required this.steps,
    required this.step,
    required this.next,
    required this.prev,
    required this.stepAmount,
    this.onSubmit,
    this.loading = false,
  });

  @override
  State<CStepper> createState() => _CStepperState();
}

class _CStepperState extends State<CStepper> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          const BrandBg(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepperHeader(
                backText: "Back",
                title: widget.steps[widget.step - 1]['title'],
                step: widget.step,
                prev: widget.prev,
                stepAmount: widget.stepAmount,
              ),
              Expanded(
                  child: Container(
                height: 20,
              )),
              AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0.0, 1.0),
                      ),
                    ),
                    child: child,
                  );
                },
                duration: const Duration(milliseconds: 300),
                child: StepContainer(
                  key: ValueKey<int>(widget.step),
                  next: widget.next,
                  onSubmit: widget.onSubmit ?? () {},
                  step: widget.step,
                  stepsLength: widget.steps.length,
                  child: widget.steps[widget.step - 1]['step'],
                  loading: widget.loading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
