import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: Spacing.medium,
            color: Colors.white,
          ),
          SizedBox(height: Spacing.extraSmall),
          Container(
            width: width * 0.7,
            height: Spacing.small,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
