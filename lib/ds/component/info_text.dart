import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class InfoText extends StatelessWidget {
  final String title;

  const InfoText({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: context.color.primary.withOpacity(0.11)),
        padding: EdgeInsets.symmetric(
            horizontal: Spacing.extraSmall_w, vertical: Spacing.extraSmall_h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: context.color.primary,
              size: 24.h,
            ),
            SizedBox(
              width: Spacing.extraSmall_w,
            ),
            Flexible(
                child: Text(title,
                    style: context.text.bodyMedium
                        ?.copyWith(color: context.color.primary)))
          ],
        ),
      );
}
