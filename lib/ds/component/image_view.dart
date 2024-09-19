import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';

enum Shape { RoundedSquare, Circle }

class ImageView extends StatelessWidget {
  final String url;
  final String? path;
  final IconSize size;
  final Shape shape;
  final Widget? placeHolder;
  final Widget? fallBackImage;

  const ImageView(
      {super.key,
      this.path,
      this.shape = Shape.RoundedSquare,
      required this.url,
      required this.size,
      this.placeHolder,
      this.fallBackImage});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: shape == Shape.RoundedSquare
            ? BorderRadius.circular(8.0)
            : BorderRadius.circular(size.height),
        child: path != null
            ? Image.file(
                File(path!),
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                fit: BoxFit.cover,
                height: size.height,
                width: size.width,
                imageUrl: url.isNotEmpty ? url : '',
                errorWidget: (_, __, ___) =>
                    fallBackImage != null ? fallBackImage! : SizedBox(),
                placeholder: (_, __) =>
                    placeHolder != null ? placeHolder! : SizedBox(),
              ),
      );
}
