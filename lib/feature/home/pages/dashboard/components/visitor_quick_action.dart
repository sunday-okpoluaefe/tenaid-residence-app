import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../ds/component/avatar.dart';

enum InviteStatus { pending, overdue, arrived }

class VisitorQuickAction extends StatelessWidget {
  final String title;
  final String status;
  final bool badge;
  final Function()? onTap;

  const VisitorQuickAction(
      {super.key,
      this.onTap,
      required this.title,
      required this.status,
      required this.badge});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(
              size: IconSize.extraLarge.height,
              title: title,
              status: badge ? status : null,
            ),
            SizedBox(
              height: Spacing.extraSmall,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: context.text.labelMedium,
                ))
          ],
        ),
      );
}
