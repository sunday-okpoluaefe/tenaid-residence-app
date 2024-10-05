import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_navigator.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../assets/assets.gen.dart';

class QuickActions extends StatelessWidget {
  final VisitorNavigator visitorNavigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _action(context, Assets.dashInvite.svg(height: 64.h), 'Invite',
              () => visitorNavigator.toInvite()),
          _action(context, Assets.removeVisitor.svg(height: 64.h), 'Exit',
              () => visitorNavigator.toExit()),
          _action(context, Assets.dashPayment.svg(height: 64.h), 'Pay', () {}),
          _action(
              context, Assets.dashUtility.svg(height: 64.h), 'Utility', () {}),
        ],
      );

  Widget _action(
          BuildContext context, Widget icon, String label, Function() onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: Spacing.extraSmall_h),
          child: Column(
            children: [
              icon,
              SizedBox(
                height: Spacing.extraExtraSmall_h,
              ),
              Text(
                label,
                style: context.text.labelLarge,
              )
            ],
          ),
        ),
      );
}
