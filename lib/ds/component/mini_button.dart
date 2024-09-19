import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class MiniButton extends StatelessWidget {
  final Function() onClick;
  final String title;
  final bool fill;
  final Widget? icon;

  const MiniButton(
      {super.key,
      this.fill = true,
      required this.onClick,
      required this.title,
      this.icon});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Spacing.small),
          decoration: BoxDecoration(
              color: fill ? context.color.secondary : context.color.surface,
              border: Border.all(
                  color: fill
                      ? context.color.secondary
                      : context.color.surfaceBright),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(right: Spacing.extraSmall),
                  child: icon!,
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  title,
                  style: context.text.titleMedium?.copyWith(
                      color: fill
                          ? context.color.surface
                          : context.color.onSurface),
                ),
              )
            ],
          ),
        ),
      );
}
