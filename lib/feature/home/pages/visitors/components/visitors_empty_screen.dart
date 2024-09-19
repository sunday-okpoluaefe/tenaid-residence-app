import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/mini_button.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../assets/assets.gen.dart';
import '../../../../../ds/component/spacing.dart';

class VisitorsEmptyScreen extends StatelessWidget {
  final bool hasError;
  final Function()? onTryAgain;

  const VisitorsEmptyScreen(
      {super.key, this.hasError = false, this.onTryAgain});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(Spacing.extraLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hasError
                ? Assets.somethingWong.svg(width: 180, fit: BoxFit.scaleDown)
                : Assets.nothingFoundDark
                    .svg(width: 180, fit: BoxFit.scaleDown),
            SizedBox(
              height: Spacing.extraLarge,
            ),
            Text(
              hasError ? 'Something went wrong' : 'Result not found',
              textAlign: TextAlign.center,
              style: context.text.titleLarge,
            ),
            SizedBox(
              height: Spacing.extraSmall,
            ),
            Text(
              hasError
                  ? 'Whoops... we encountered an issue. kindly try again'
                  : 'We\'ve looked everywhere,\ncould not find anything.',
              textAlign: TextAlign.center,
              style: context.text.titleMedium?.fade(context),
            ),
            SizedBox(
              height: Spacing.medium,
            ),
            if (onTryAgain != null)
              SizedBox(
                width: 180,
                child: MiniButton(onClick: onTryAgain!, title: 'Try again'),
              )
          ],
        ),
      );
}
