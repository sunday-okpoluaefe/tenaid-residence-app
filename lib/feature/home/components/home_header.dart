import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/asset_icon.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.locale.hello,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.titleLarge?.copyWith(
                                  color:
                                      context.color.onSurface.withOpacity(0.7)),
                            ),
                            Text(
                              'Jameson Adams',
                              style: context.text.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            //Text('Jameson Adams'),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: AssetIcon(
                            size: IconSize.extraLarge,
                            asset: 'assets/icon.svg'))
                  ],
                )
              ],
            )),
      );
}
