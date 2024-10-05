import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

class Avatar extends StatelessWidget {
  final String title;
  final double size;
  final Widget? icon;
  final double opacity;
  final String? status;

  const Avatar(
      {super.key,
      this.opacity = 1,
      required this.title,
      this.status,
      this.icon,
      required this.size});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: size,
            width: size,
            decoration: BoxDecoration(
                color: context.color.surfaceBright.withOpacity(opacity),
                shape: BoxShape.circle),
            child: icon != null
                ? icon!
                : Text(
                    title.avatar,
                    style: context.text.bodyMedium,
                  ),
          ),
          if (status?.isNotEmpty == true)
            Positioned(
                child: Container(
              height: Spacing.small_h,
              width: Spacing.small_w,
              decoration: BoxDecoration(
                  color: _statusColor(context, status!),
                  shape: BoxShape.circle),
            ))
        ],
      );

  Color _statusColor(BuildContext context, String status) {
    switch (status) {
      case 'arrived':
        return context.color.primaryFixed;
      case 'pending':
        return context.color.secondaryFixed;
      case 'overdue':
        return context.color.error;
      default:
        return context.color.primaryFixed;
    }
  }
}
