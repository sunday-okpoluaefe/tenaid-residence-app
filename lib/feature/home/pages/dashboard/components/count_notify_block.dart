import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class CountNotifyBlock extends StatelessWidget {
  final int count;
  final String text;
  final Function() onTap;

  const CountNotifyBlock(
      {super.key,
      required this.count,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) => count > 0
      ? InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(
                left: Spacing.small, right: Spacing.small, top: Spacing.small),
            padding: EdgeInsets.only(left: Spacing.small, right: Spacing.small),
            decoration: BoxDecoration(
                color: context.color.primary.withOpacity(0.11),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: Spacing.extraSmall),
                      padding:
                          EdgeInsets.symmetric(horizontal: Spacing.extraSmall),
                      decoration: BoxDecoration(
                          color: context.color.primary,
                          borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      child: Text(
                        count.toString(),
                        style: context.text.bodyMedium
                            ?.copyWith(color: context.color.surface),
                      ),
                    ),
                    SizedBox(
                      width: Spacing.extraSmall,
                    ),
                    Text(
                      text,
                      style: context.text.bodyMedium
                          ?.copyWith(color: context.color.primary),
                    )
                  ],
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.color.primary,
                )
              ],
            ),
          ),
        )
      : SizedBox();
}
