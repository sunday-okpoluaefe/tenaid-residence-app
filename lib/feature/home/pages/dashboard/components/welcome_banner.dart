import 'package:flutter/material.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../assets/assets.gen.dart';
import '../../../../../ds/component/spacing.dart';

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: Spacing.small, right: Spacing.small),
        child: Stack(
          children: [
            Assets.welcomeBannerBg
                .svg(width: MediaQuery.of(context).size.width),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(Spacing.small),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.locale.welcome_tenaid,
                            style: context.text.titleMedium,
                          ),
                          SizedBox(
                            height: Spacing.extraSmall,
                          ),
                          Text(
                            context.locale.welcome_tenaid_body,
                            style: context.text.bodySmall?.copyWith(
                                color:
                                    context.color.onSurface.withOpacity(0.7)),
                          )
                        ],
                      ),
                      Assets.welcomeStarter.svg()
                    ],
                  ),
                ))
          ],
        ),
      );
}
