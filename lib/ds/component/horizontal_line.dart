import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        color: context.color.onSecondary.withOpacity(0.4),
      );
}
