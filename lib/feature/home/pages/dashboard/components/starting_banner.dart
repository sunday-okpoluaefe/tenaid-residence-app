import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../ds/component/spacing.dart';

class StartingBanner extends StatelessWidget {
  final String title;
  final String body;
  final Widget icon;
  final Function() onTap;

  const StartingBanner(
      {super.key,
      required this.title,
      required this.body,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: Spacing.small_h),
          padding: EdgeInsets.symmetric(
              horizontal: Spacing.small_w, vertical: Spacing.small_h),
          decoration: BoxDecoration(
            color: context.color.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  SizedBox(
                    width: Spacing.small_w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.text.titleMedium,
                      ),
                      SizedBox(
                        height: Spacing.extraExtraSmall_h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          body,
                          style: context.text.bodySmall?.fade(context),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Icon(Icons.chevron_right_rounded)
            ],
          ),
        ),
      );
}
