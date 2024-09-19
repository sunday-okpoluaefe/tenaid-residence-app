import 'package:flutter/material.dart';
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
          _action(context, Assets.dashInvite.svg(), 'Invite',
              () => visitorNavigator.toInvite()),
          _action(context, Assets.dashPayment.svg(), 'Pay', () {}),
          _action(context, Assets.dashUtility.svg(), 'Utility', () {}),
          _action(context, Assets.dashMore.svg(), 'More', () {}),
        ],
      );

  Widget _action(
          BuildContext context, Widget icon, String label, Function() onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: Spacing.extraSmall),
          child: Column(
            children: [
              icon,
              SizedBox(
                height: Spacing.extraExtraSmall,
              ),
              Text(
                label,
                style: context.text.bodyMedium,
              )
            ],
          ),
        ),
      );
}
