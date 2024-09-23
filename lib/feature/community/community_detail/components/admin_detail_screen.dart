import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/settings_item.dart';

class AdminDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: Spacing.small, right: Spacing.small, top: Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: context.text.titleMedium?.fade(context)),
            SizedBox(
              height: Spacing.extraSmall,
            ),
            SettingsItem(
              label: 'Members',
              icon: Assets.communities.svg(),
            ),
            HorizontalLine(),
            SettingsItem(
              label: 'Access points',
              icon: Assets.securitySafe.svg(),
            ),
            HorizontalLine(),
            SettingsItem(
              label: 'Payments',
              icon: Assets.moneys.svg(),
            ),
            HorizontalLine(),
            SettingsItem(
              label: 'Account number',
              icon: Assets.bank.svg(),
            ),
            HorizontalLine()
          ],
        ),
      );
}
