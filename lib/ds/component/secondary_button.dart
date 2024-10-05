import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function() onClick;
  final EdgeInsets modifier;

  const SecondaryButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.modifier = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) => Padding(
        padding: modifier,
        child: OutlinedButton(
            onPressed: onClick,
            child: SizedBox(
              height: 64.h,
              child: Center(
                  child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0.sp,
                    color: context.color.secondary),
              )),
            )),
      );
}
