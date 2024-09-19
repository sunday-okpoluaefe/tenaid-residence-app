import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String? description;

  const PageHeader({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.headlineSmall,
          ),
          if (description != null)
            Padding(
              padding: EdgeInsets.only(top: Spacing.extraExtraSmall),
              child: Text(
                description!,
                style: context.text.bodyMedium?.fade(context),
              ),
            ),
        ],
      );
}
