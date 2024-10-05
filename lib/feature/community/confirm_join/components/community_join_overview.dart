import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/image_view.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class CommunityJoinOverview extends StatelessWidget {
  final CommunityDomain community;

  const CommunityJoinOverview({super.key, required this.community});

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
            Text(community.name ?? "", style: context.text.titleLarge),
            SizedBox(height: Spacing.small_h),
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
            _label(context, context.locale.address),
            Text(
              community.address?.address ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.text.bodyMedium,
            )
          ],
        ),
      );

  _label(BuildContext context, String label) => Text(
        label,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.text.bodyMedium?.fade(context),
      );
}
