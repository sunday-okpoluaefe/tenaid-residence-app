import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class QuickActionsLoader extends StatelessWidget {
  final double size;

  const QuickActionsLoader({super.key, required this.size});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _item(context),
          _item(context),
          _item(context),
          _item(context),
        ],
      ));

  Widget _item(BuildContext context) => Column(
        children: [
          Container(
            height: size.h,
            width: size.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: context.color.surface),
          ),
          SizedBox(
            height: Spacing.extraSmall_h,
          ),
          Container(
            height: Spacing.small_h,
            color: context.color.surface,
            width: MediaQuery.of(context).size.width * 0.2,
          )
        ],
      );
}
