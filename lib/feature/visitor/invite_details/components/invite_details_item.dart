import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../ds/component/spacing.dart';

class InviteDetailsItem extends StatelessWidget {
  final String label;
  final String value;
  final Widget? icon;

  const InviteDetailsItem(
      {super.key, required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            top: Spacing.small, left: Spacing.small, right: Spacing.small),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: Spacing.small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              label,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.titleSmall?.fade(context),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: Spacing.extraExtraSmall),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(value,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.text.bodyMedium),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (icon != null) icon!
                ],
              ),
            ),
            SizedBox(
              height: Spacing.extraSmall,
            ),
            HorizontalLine()
          ],
        ),
      );
}
