import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/list_item.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';

class AddCommunityBottomSheet extends StatelessWidget {
  final Function() onJoin;
  final Function() onCreate;

  const AddCommunityBottomSheet(
      {super.key, required this.onJoin, required this.onCreate});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: Spacing.small_w,
            right: Spacing.small_w,
            bottom: Spacing.small_h),
        child: Column(
          children: [
            ListItem(
                onClick: (_) => onJoin(),
                itemModel: ListItemModel(
                    icon: Assets.joinCommunity.svg(),
                    title: 'Join a community',
                    description: context.locale.join_community_body)),
            HorizontalLine(),
            ListItem(
                onClick: (_) => onCreate(),
                itemModel: ListItemModel(
                    icon: Assets.createCommunity.svg(),
                    title: 'Create a community',
                    description: context.locale.create_community_body))
          ],
        ),
      );
}
