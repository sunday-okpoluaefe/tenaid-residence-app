import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final double top;
  final double bottom;
  final String? description;
  final Widget? descriptionWidget;

  const PageHeader(
      {super.key,
      required this.title,
      this.descriptionWidget,
      this.description,
      this.top = 0,
      this.bottom = 0});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: top,
          ),
          Text(
            title,
            style: context.text.titleLarge,
          ),
          if (description != null && descriptionWidget == null)
            Padding(
              padding: EdgeInsets.only(top: Spacing.extraExtraSmall),
              child: Text(
                description!,
                style: context.text.bodyMedium?.fade(context),
              ),
            )
          else if (descriptionWidget != null)
            descriptionWidget!,
          SizedBox(
            height: bottom,
          ),
        ],
      );
}
