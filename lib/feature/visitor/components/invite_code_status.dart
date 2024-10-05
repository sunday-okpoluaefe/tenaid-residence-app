import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/pair.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../utils/xts/status.dart';

class InviteCodeStatus extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  const InviteCodeStatus({super.key, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    Status status = Pair(first: start, second: end).status(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Spacing.small_w, vertical: Spacing.extraExtraSmall_h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: status.color),
      child: Text(
        status.title,
        style: context.text.labelMedium?.copyWith(color: context.color.surface),
      ),
    );
  }
}
