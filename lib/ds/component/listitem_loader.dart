import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tenaid_mobile/ds/component/place_holders.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class ListItemLoader extends StatelessWidget {
  final int count;

  const ListItemLoader({super.key, required this.count});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.builder(
          itemCount: count,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.all(Spacing.small),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: Spacing.extraLarge,
                      height: Spacing.extraLarge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: context.color.surface,
                      ),
                    ),
                    SizedBox(
                      width: Spacing.small,
                    ),
                    TitlePlaceholder(
                        width: MediaQuery.of(context).size.width * 0.65)
                  ],
                ),
              )));
}
