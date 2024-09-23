import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class DetailText extends StatelessWidget {
  final String label;
  final String detail;

  const DetailText({super.key, required this.label, required this.detail});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.text.bodyMedium?.fade(context),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: Spacing.extraExtraSmall,
          ),
          Text(
            detail,
            style: context.text.titleMedium,
            textAlign: TextAlign.start,
          )
        ],
      );
}
