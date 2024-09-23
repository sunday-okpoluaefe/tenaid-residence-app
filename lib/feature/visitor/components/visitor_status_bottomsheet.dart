import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/list_detail_item.dart';
import '../../../ds/component/mini_button.dart';
import '../../../utils/pair.dart';
import '../../../utils/xts/status.dart';
import 'invite_code_status.dart';

class VisitorStatusBottomSheet extends StatelessWidget {
  final VisitorDomain visitor;

  const VisitorStatusBottomSheet({super.key, required this.visitor});

  @override
  Widget build(BuildContext context) {
    Status status =
        Pair(first: visitor.startDate, second: visitor.endDate).status(context);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: QrImageView(data: visitor.code!),
        ),
        SizedBox(
          height: Spacing.extraSmall,
        ),
        Text(
          visitor.code!.asCode,
          style: context.text.headlineSmall,
        ),
        SizedBox(
          height: Spacing.extraExtraSmall,
        ),
        InviteCodeStatus(
          start: visitor.startDate,
          end: visitor.endDate,
        ),
        SizedBox(
          height: Spacing.small,
        ),
        ListDetailItem(
          label: 'Guest name',
          value: visitor.name!,
        ),
        ListDetailItem(
          label: 'Valid from',
          value: visitor.startDate.asDateTimeString,
        ),
        ListDetailItem(
          label: 'Expires at',
          value: visitor.endDate.asDateTimeString,
        ),
        ListDetailItem(
          label: 'Purpose of visit',
          value: visitor.reason!,
        ),
        SizedBox(
          height: Spacing.medium,
        ),
        if (status.title != 'Expired')
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.extraExtraLarge),
            child: Column(
              children: [
                MiniButton(
                  title: 'Share invite',
                  icon: Assets.send.svg(color: context.color.surface),
                  onClick: () {},
                ),
                SizedBox(
                  height: Spacing.medium,
                ),
              ],
            ),
          )
      ],
    );
  }
}
