import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

class Avatar extends StatelessWidget {
  final String title;
  final double size;
  final String? status;

  const Avatar(
      {super.key, required this.title, this.status, required this.size});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: size,
            width: size,
            decoration: BoxDecoration(
                color: context.color.surfaceBright, shape: BoxShape.circle),
            child: Text(
              title.avatar,
              style: context.text.bodyLarge,
            ),
          ),
          if (status?.isNotEmpty == true)
            Positioned(
                child: Container(
              height: 16,
              width: 16,
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
