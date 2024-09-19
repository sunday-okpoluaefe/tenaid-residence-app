import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/image_view.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';

class CommunityListItem extends StatelessWidget {
  final CommunityDomain community;
  final Function(CommunityDomain selected) onTap;

  const CommunityListItem(
      {super.key, required this.community, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(community),
        child: Padding(
          padding: EdgeInsets.all(Spacing.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageView(
                      url: community.images.firstOrNull ?? "",
                      size: IconSize.extraLarge),
                  SizedBox(
                    width: Spacing.small,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          community.name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleMedium,
                        ),
                        Text(
                          community.address?.address ?? "",
                          maxLines: 2,
                          style: context.text.bodySmall?.copyWith(
                              color: context.color.surfaceContainerHighest),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: Spacing.extraSmall,
                        ),
                        communityStats(context,
                            members: community.members?.toString() ?? "0",
                            location:
                                '${community.address?.city}, ${community.address?.country}'),
                      ],
                    ),
                  )
                ],
              ),
              Icon(Icons.chevron_right_rounded)
            ],
          ),
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
          width: Spacing.extraExtraSmall,
        ),
        Text(
          members,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.bodySmall,
        ),
        SizedBox(
          width: Spacing.small,
        ),
        Assets.location.svg(),
        SizedBox(
          width: Spacing.extraExtraSmall,
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
