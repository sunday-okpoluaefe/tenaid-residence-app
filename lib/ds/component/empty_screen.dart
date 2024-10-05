import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/mini_button.dart';
import '../../../ds/component/spacing.dart';

class EmptyScreen extends StatelessWidget {
  final bool hasError;
  SvgGenImage? emptyWidget;
  final String? retryTitle;
  final Function()? onTryAgain;

  EmptyScreen(
      {super.key,
      this.hasError = false,
      this.retryTitle,
      this.onTryAgain,
      this.emptyWidget = Assets.nothingFoundDark});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(
            vertical: Spacing.extraLarge_h, horizontal: Spacing.extraLarge_w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hasError
                ? Assets.somethingWong.svg(width: 180, fit: BoxFit.scaleDown)
                : emptyWidget!.svg(width: 180, fit: BoxFit.scaleDown),
            SizedBox(
              height: Spacing.extraLarge_h,
            ),
            Text(
              hasError ? 'Something went wrong' : 'Result not found',
              textAlign: TextAlign.center,
              style: context.text.titleLarge,
            ),
            SizedBox(
              height: Spacing.extraSmall_h,
            ),
            Text(
              hasError
                  ? 'Whoops! we encountered an issue. kindly try again'
                  : 'We\'ve looked everywhere, could not find anything.',
              textAlign: TextAlign.center,
              style: context.text.titleMedium?.fade(context),
            ),
            SizedBox(
              height: Spacing.medium_h,
            ),
            if (onTryAgain != null)
              SizedBox(
                width: 180,
                child: MiniButton(
                    onClick: onTryAgain!, title: retryTitle ?? 'Try again'),
              )
          ],
        ),
      );
}
