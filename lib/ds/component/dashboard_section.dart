import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class DashboardSection extends StatelessWidget {
  final List<Widget> children;
  final Axis axis;

  const DashboardSection(
      {super.key, required this.children, required this.axis});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(
            vertical: Spacing.small_h, horizontal: Spacing.small_w),
        decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.all(Radius.circular(10.w))),
        margin: EdgeInsets.symmetric(horizontal: Spacing.extraSmall_w),
        child: axis == Axis.vertical
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
      );
}
