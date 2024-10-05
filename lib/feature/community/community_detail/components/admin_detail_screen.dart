import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/settings_item.dart';

class AdminDetailsScreen extends StatelessWidget {
  final CommunityNavigator navigator = GetIt.instance.get();
  final CommunityDomain? community;

  AdminDetailsScreen({super.key, this.community});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: Spacing.small_w,
            right: Spacing.small_w,
            top: Spacing.large_h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: context.text.titleMedium?.fade(context)),
            SizedBox(
              height: Spacing.extraSmall_h,
            ),
            SettingsItem(
              label: 'Members',
              icon: Assets.communities.svg(),
            ),
            HorizontalLine(),
            SettingsItem(
              label: 'Access points',
              icon: Assets.securitySafe.svg(),
              onTap: () => navigator.toCommunityAccessPointScreen(
                  community: community?.id ?? ''),
            ),
            HorizontalLine(),
            SettingsItem(
              label: 'Streets',
              icon: Assets.streetDirection.svg(),
              onTap: () =>
                  navigator.toCommunityStreets(community: community?.id ?? ''),
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
