import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/spacing.dart';

class DataItem extends StatelessWidget {
  final String email;
  final String phone;

  const DataItem({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _dataItem(context, Assets.phone.svg(), phone),
          SizedBox(
            height: Spacing.small,
          ),
          _dataItem(context, Assets.sms.svg(height: 18), email),
        ],
      );

  Widget _dataItem(BuildContext context, Widget icon, String label) => Row(
        children: [
          icon,
          SizedBox(
            width: Spacing.small,
          ),
          Text(
            label,
            style: context.text.bodyMedium?.fade(context),
          )
        ],
      );
}
