import 'package:flutter/material.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/image_view.dart';

class ProfileImage extends StatelessWidget {
  final String path;
  final IconSize? size;

  const ProfileImage({super.key, required this.path, this.size});

  @override
  Widget build(BuildContext context) => ImageView(
        url: path,
        shape: Shape.Circle,
        size: size ?? IconSize.large,
        fallBackImage: Assets.manAvatar.svg(),
      );
}
