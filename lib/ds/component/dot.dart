import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color color;
  final double size;

  const Dot({super.key, this.color = Colors.black87, this.size = 10});

  @override
  Widget build(BuildContext context) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color));
}
