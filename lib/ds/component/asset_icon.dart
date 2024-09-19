import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icon_size.dart';

class AssetIcon extends StatelessWidget {
  final IconSize size;
  final String asset;

  const AssetIcon({super.key, required this.size, required this.asset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width,
        height: size.height,
        child: SvgPicture.asset(asset, fit: BoxFit.scaleDown));
  }
}
