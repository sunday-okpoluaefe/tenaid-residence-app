import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class CommunityImagesHolder extends StatelessWidget {
  final Function(int) onItemClicked;
  final Function(int) onRemoveItem;
  final Function(int) onEditItem;
  final List<String> images;

  const CommunityImagesHolder(
      {super.key,
      required this.onItemClicked,
      required this.images,
      required this.onEditItem,
      required this.onRemoveItem});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height *
            0.6, // Define the height of the GridView
        child: Padding(
          padding: EdgeInsets.all(Spacing.extraSmall),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // 2 squares per row
              crossAxisSpacing: Spacing.small,
              // space between squares horizontally
              mainAxisSpacing: Spacing.small,
              // space between squares vertically
              childAspectRatio: 1.0, // To maintain the square aspect ratio
            ),
            itemCount: 4, // Number of squares
            itemBuilder: (context, index) {
              return index > images.length
                  ? ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: _imagePlaceHolder(context: context, index: index),
                    )
                  : (index < images.length
                      ? _imagePlaceHolder(
                          context: context,
                          index: index,
                          path: images[index],
                          onEdit: () => onEditItem(index),
                          onRemove: () => onRemoveItem(index))
                      : InkWell(
                          onTap: () => onItemClicked(index),
                          child:
                              _imagePlaceHolder(context: context, index: index),
                        ));
            },
          ),
        ),
      );

  Widget _holder(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(context),
            SizedBox(
              height: Spacing.extraSmall,
            ),
            Text(
              'Tap to add',
              style: context.text.bodyMedium,
            )
          ],
        ),
      );

  Widget _imageHolder(BuildContext context,
          {required String path,
          required Function() onEdit,
          required Function() onRemove}) =>
      Stack(
        children: [
          Image.file(
            File(path),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
              bottom: Spacing.small,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buttonWrapper(context,
                      button: Assets.noteRemove.svg(), onTap: onRemove),
                  _buttonWrapper(context,
                      button: Assets.edit.svg(), onTap: onEdit)
                ],
              ))
        ],
      );

  Widget _buttonWrapper(BuildContext context,
          {required Widget button, required Function() onTap}) =>
      InkWell(
        onTap: onTap,
        child: Container(
          child: button,
          padding: EdgeInsets.all(Spacing.extraSmall),
          decoration: BoxDecoration(
              color: context.color.surfaceContainer.withOpacity(0.6),
              shape: BoxShape.circle),
        ),
      );

  Widget _imagePlaceHolder(
          {required BuildContext context,
          String? path,
          required int index,
          Function()? onEdit,
          Function()? onRemove}) =>
      DottedBorder(
          radius: Radius.circular(10),
          borderType: BorderType.RRect,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: path != null
                ? _imageHolder(context,
                    path: path, onEdit: onEdit!, onRemove: onRemove!)
                : _holder(context),
          ));

  Widget _button(BuildContext context) => Container(
        child: Icon(
          Icons.add,
          color: context.color.surface,
        ),
        padding: EdgeInsets.all(Spacing.extraSmall),
        decoration:
            BoxDecoration(color: context.color.primary, shape: BoxShape.circle),
      );
}
