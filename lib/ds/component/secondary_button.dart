import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function() onClick;
  final EdgeInsets modifier;

  const SecondaryButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.modifier = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) => Padding(
        padding: modifier,
        child: OutlinedButton(
            onPressed: onClick,
            child: SizedBox(
              height: 64,
              child: Center(child: Text(title)),
            )),
      );
}
