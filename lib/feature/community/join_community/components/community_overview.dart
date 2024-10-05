import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/image_view.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../search_community/components/community_list_item.dart';

class CommunityOverview extends StatelessWidget {
  final CommunityDomain community;

  const CommunityOverview({super.key, required this.community});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(
            horizontal: Spacing.small_w, vertical: Spacing.small_h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: context.color.surfaceContainerLow.withOpacity(0.3),
                width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            ImageView(
                    url: community.image ?? "", size: IconSize.extraExtraLarge)
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: community.images
                  .map((image) => Row(
                        children: [
                          ImageView(url: image, size: IconSize.extraExtraLarge),
                          SizedBox(
                            width: Spacing.extraSmall_w,
                          )
                        ],
                      ))
                  .toList(),
            ),
            SizedBox(
              height: Spacing.small_h,
            ),
            Text(
              community.name ?? "",
              style: context.text.bodyLarge,
            ),
            SizedBox(
              height: Spacing.extraSmall_h,
            ),
            Text(
              community.address?.address ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.text.bodyMedium
                  ?.copyWith(color: context.color.onSurface.withOpacity(0.7)),
            ),
            SizedBox(
              height: Spacing.medium_h,
            ),
            Text(
              community.description ?? "",
              overflow: TextOverflow.ellipsis,
              style: context.text.titleMedium,
              maxLines: 3,
            ),
            SizedBox(
              height: Spacing.small_h,
            ),
            communityStats(context,
                members: community.members?.toString() ?? "0",
                location:
                    '${community.address?.city}, ${community.address?.country}'),
          ],
        ),
      );
}
