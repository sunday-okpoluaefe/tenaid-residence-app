import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/icon_size.dart';
import '../../../../ds/component/image_view.dart';
import '../../../../ds/component/spacing.dart';

class PictureItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function() onJoinCommunity;
  final String? community;
  final Function() onQrClicked;

  const PictureItem(
      {super.key,
      required this.onJoinCommunity,
      required this.onQrClicked,
      required this.imageUrl,
      required this.name,
      required this.community});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageView(
                url: imageUrl,
                size: IconSize.largeProfile,
                shape: Shape.Circle,
                fallBackImage: Assets.manAvatar.svg(),
              ),
              SizedBox(
                width: Spacing.small_w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: Spacing.extraExtraSmall_h,
                  ),
                  community != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Text(
                            community!,
                            maxLines: 1,
                            style: context.text.bodyMedium?.fade(context),
                          ),
                        )
                      : GestureDetector(
                          onTap: onJoinCommunity,
                          child: Text('Join a community',
                              style: context.text.bodyMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: context.color.surfaceTint)),
                        )
                ],
              )
            ],
          ),
          if (community != null)
            GestureDetector(
              onTap: onQrClicked,
              child: Assets.qrCode.svg(),
            )
        ],
      );
}
