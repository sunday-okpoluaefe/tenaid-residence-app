import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import 'place_holders.dart';
import 'spacing.dart';

class PageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          children: [
            _large(context),
            for (int i = 0; i < 3; i++) _list(context),
            _large(context),
            for (int i = 0; i < 5; i++) _list(context),
          ],
        ),
      );

  Widget _large(BuildContext context) => Container(
        margin: EdgeInsets.only(
            bottom: Spacing.small, right: Spacing.small, left: Spacing.small),
        height: 92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: context.color.surface,
        ),
      );

  Widget _list(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            bottom: Spacing.small, left: Spacing.small, right: Spacing.small),
        child: Row(
          children: [
            Container(
              width: Spacing.extraLarge,
              height: Spacing.extraLarge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: context.color.surface,
              ),
            ),
            SizedBox(
              width: Spacing.small,
            ),
            TitlePlaceholder(width: MediaQuery.of(context).size.width * 0.65)
          ],
        ),
      );
}
