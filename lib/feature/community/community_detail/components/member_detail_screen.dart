import 'package:flutter/material.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../ds/component/app_table_view.dart';
import '../../../../ds/component/spacing.dart';

class MemberDetailScreen extends StatelessWidget {
  final AccountCommunityDomain community;

  const MemberDetailScreen({super.key, required this.community});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: Spacing.small, right: Spacing.small, top: Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.locale.section_member_address,
                style: context.text.titleMedium),
            AppTableView(
              items: [
                TableItemModel(
                    key: context.locale.street,
                    value: community.street?.name ?? ''),
                TableItemModel(
                    key: context.locale.body_house_number,
                    value: community.houseName ?? ''),
                TableItemModel(
                    key: context.locale.apartment,
                    value: community.apartment ?? ''),
              ],
            )
          ],
        ),
      );
}
