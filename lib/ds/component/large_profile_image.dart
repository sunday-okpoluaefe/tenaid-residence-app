import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../feature/home/components/profile_image.dart';
import 'icon_size.dart';

class LargeProfileImage extends StatelessWidget {
  final String image;
  final IconSize? size;

  const LargeProfileImage({super.key, required this.image, this.size});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ProfileImage(
            path: image,
            size: size ?? IconSize.extraLargeProfile,
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: context.color.primary, width: 1)),
              ))
        ],
      );
}
