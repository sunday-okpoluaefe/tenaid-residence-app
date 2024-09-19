import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class SettingsItem extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color? color;
  final Function()? onTap;
  final bool isSwitch;
  final bool isError;

  const SettingsItem(
      {super.key,
      this.onTap,
      required this.label,
      required this.icon,
      this.isError = false,
      this.color,
      this.isSwitch = false});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Spacing.small),
              child: Row(
                children: [
                  icon,
                  SizedBox(
                    width: Spacing.small,
                  ),
                  Text(
                    label,
                    style: context.text.titleMedium?.copyWith(
                        color: isError
                            ? context.color.error
                            : context.color.onSurface),
                  )
                ],
              ),
            ),
            !isSwitch
                ? Icon(Icons.chevron_right_rounded)
                : Switch(value: true, onChanged: (x) {})
          ],
        ),
      );
}
