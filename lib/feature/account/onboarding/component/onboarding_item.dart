import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../ds/component/spacing.dart';

class OnBoardingItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String body;

  const OnBoardingItem(
      {super.key, required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SizedBox(height: Spacing.medium_h),
        Text(
          title,
          style: context.text.headlineLarge,
        ),
        SizedBox(height: Spacing.extraSmall_h),
        Text(body, style: context.text.bodyMedium?.fade(context)),
      ],
    );
  }
}
