import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import 'horizontal_line.dart';

class TableItemModel {
  final String key;
  final String value;

  TableItemModel({required this.key, required this.value});
}

class AppTableView extends StatelessWidget {
  final List<TableItemModel> items;

  const AppTableView({super.key, required this.items});

  @override
  Widget build(BuildContext context) => Column(
        children: items.map((item) => _tableItem(context, item)).toList(),
      );

  Widget _tableItem(BuildContext context, TableItemModel item) => Padding(
        padding: EdgeInsets.only(top: Spacing.small_h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(item.key,
                      style: context.text.bodyMedium?.fade(context)),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      item.value,
                      style: context.text.labelLarge,
                      textAlign: TextAlign.end,
                    ))
              ],
            ),
            SizedBox(
              height: Spacing.small_h,
            ),
            HorizontalLine()
          ],
        ),
      );
}
