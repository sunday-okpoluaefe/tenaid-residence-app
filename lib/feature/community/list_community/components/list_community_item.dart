import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/image_view.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';

class ListCommunityItem extends StatelessWidget {
  final AccountCommunityDomain community;
  final Function(AccountCommunityDomain selected) onTap;

  const ListCommunityItem(
      {super.key, required this.community, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(community),
        child: Stack(
          children: [
            Positioned(
              top: Spacing.extraSmall_h,
              bottom: Spacing.extraSmall_h,
              child: Container(
                width: 5,
                color: community.status == 'approved'
                    ? context.color.primaryFixed
                    : context.color.secondaryFixed,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Spacing.small_w,
                  top: Spacing.small_h,
                  bottom: Spacing.small_h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: Spacing.extraExtraSmall_h),
                        child: ImageView(
                            url: community.community?.images.firstOrNull ?? "",
                            size: IconSize.extraLarge),
                      ),
                      SizedBox(
                        width: Spacing.small_w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                    child: Text(
                                  community.community?.name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.text.titleMedium,
                                )),
                                if (community.isAdmin == true)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Spacing.extraSmall_w),
                                    child: Assets.adminUser.svg(),
                                  ),
                                if (community.isPrimary == true)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Spacing.extraExtraSmall_w),
                                    child: Assets.securityUser.svg(height: 27),
                                  )
                              ],
                            ),
                            Text(
                              community.community?.address?.address ?? "",
                              maxLines: 2,
                              style: context.text.bodySmall?.copyWith(
                                  color: context.color.surfaceContainerHighest),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            )
          ],
        ),
      );
}

Widget communityStats(BuildContext context,
        {required String location, required String members}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.members.svg(),
        SizedBox(
          width: Spacing.extraExtraSmall_w,
        ),
        Text(
          members,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.bodySmall,
        ),
        SizedBox(
          width: Spacing.small_w,
        ),
        Assets.location.svg(),
        SizedBox(
          width: Spacing.extraExtraSmall_w,
        ),
        Flexible(
          child: Text(
            location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.text.bodySmall,
          ),
        )
      ],
    );
