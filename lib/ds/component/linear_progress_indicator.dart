import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class TLinearProgressIndicator extends StatelessWidget {
  final int steps;
  final int current;

  const TLinearProgressIndicator(
      {super.key, required this.steps, required this.current});

  @override
  Widget build(BuildContext context) {
    return LinearProgressBar(
      maxSteps: steps,
      currentStep: current,
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      borderRadius: BorderRadius.circular(10),
      progressType: LinearProgressBar.progressTypeLinear,
    );
  }
}
