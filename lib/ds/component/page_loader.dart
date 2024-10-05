import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import 'place_holders.dart';
import 'spacing.dart';

class PageLoader extends StatelessWidget {
  final double padding;

  const PageLoader({super.key, this.padding = 16});

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
            bottom: Spacing.small_h, right: padding, left: padding),
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: context.color.surface,
        ),
      );

  Widget _list(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            bottom: Spacing.small_h, left: padding, right: padding),
        child: Row(
          children: [
            Container(
              width: Spacing.extraLarge_w,
              height: Spacing.extraLarge_h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: context.color.surface,
              ),
            ),
            SizedBox(
              width: Spacing.small_w,
            ),
            TitlePlaceholder(width: MediaQuery.of(context).size.width * 0.60)
          ],
        ),
      );
}
