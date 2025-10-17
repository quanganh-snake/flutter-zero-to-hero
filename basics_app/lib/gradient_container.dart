import 'package:basics_app/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.startColor,
    required this.endColor,
    this.startAlignment,
    this.endAlignment,
  });

  const GradientContainer.purple({super.key})
    : startColor = const Color.fromARGB(255, 105, 80, 120),
      endColor = const Color.fromARGB(255, 35, 0, 61),
      startAlignment = Alignment.topLeft,
      endAlignment = Alignment.bottomRight;

  final Color startColor;
  final Color endColor;
  final AlignmentGeometry? startAlignment;
  final AlignmentGeometry? endAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: startAlignment ?? Alignment.topLeft,
          end: endAlignment ?? Alignment.bottomRight,
        ),
      ),
      child: Center(child: const DiceRoller()),
    );
  }
}
