import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class ListItemModel {
  final String title;
  final String? description;
  final Widget? icon;

  ListItemModel({required this.title, this.description, this.icon});
}

class ListItem extends StatelessWidget {
  final ListItemModel itemModel;
  final bool showTrailingIcon;
  final Function(ListItemModel item)? onClick;

  const ListItem(
      {super.key,
      required this.itemModel,
      this.onClick,
      this.showTrailingIcon = true});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (onClick != null) onClick!(itemModel);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Spacing.small_h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (itemModel.icon != null)
                        Padding(
                          padding: EdgeInsets.only(right: Spacing.small_w),
                          child: itemModel.icon!,
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              itemModel.title,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.titleMedium,
                            ),
                          ),
                          if (itemModel.description != null)
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Spacing.extraExtraSmall_h),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(itemModel.description!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        context.text.bodyMedium?.fade(context)),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  if (showTrailingIcon)
                    const Icon(
                      Icons.chevron_right_outlined,
                      size: 24,
                    )
                ],
              )
            ],
          ),
        ),
      );
}
