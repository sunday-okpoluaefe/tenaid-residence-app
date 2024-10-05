import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import 'dotted_loader.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final EdgeInsets modifier;
  final bool loading;
  final bool isBottomSheet;
  final bool enabled;
  final Function() onClick;

  const PrimaryButton(
      {super.key,
      this.isBottomSheet = false,
      required this.title,
      this.modifier = EdgeInsets.zero,
      this.loading = false,
      this.enabled = true,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: modifier,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: loading
                  ? (isBottomSheet
                      ? context.color.onSurface
                      : context.color.secondaryContainer)
                  : (isBottomSheet
                      ? context.color.secondary
                      : context.color.primary)),
          onPressed: enabled
              ? () {
                  // prevent click when in loading state
                  if (!loading) onClick();
                }
              : null,
          child: SizedBox(
            height: 64.h,
            child: loading
                ? DottedLoader(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    size: 38.w,
                  )
                : Center(child: Text(title)),
          )),
    );
  }
}
