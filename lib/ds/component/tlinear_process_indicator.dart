import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class TLinearProcessIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 3,
        child: LinearProgressIndicator(
          color: context.color.primary,
          backgroundColor: context.color.surfaceContainer,
        ),
      );
}
