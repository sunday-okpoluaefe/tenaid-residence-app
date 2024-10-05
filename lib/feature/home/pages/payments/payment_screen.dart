import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';

import '../../../../ds/component/animated_tab.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
              child: AnimatedAppTab(
                  onChanged: (c) {}, items: ['Community', 'Utility']),
            )
          ]))
        ],
      );
}
