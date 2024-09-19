import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/avatar.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/visitor_xts.dart';

class VisitorListItem extends StatelessWidget {
  final VisitorDomain visitor;
  final bool showStatus;
  final Function()? onTap;

  const VisitorListItem(
      {super.key, required this.visitor, this.showStatus = true, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Padding(
          padding: EdgeInsets.all(Spacing.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Avatar(
                      title: visitor.name ?? "",
                      status: showStatus ? visitor.status : null,
                      size: IconSize.extraLarge.height),
                  SizedBox(
                    width: Spacing.small,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          visitor.name ?? "",
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Spacing.extraExtraSmall),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(visitor.dateTime,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.bodySmall?.fade(context)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Icon(Icons.chevron_right_rounded)
            ],
          ),
        ),
      );
}
