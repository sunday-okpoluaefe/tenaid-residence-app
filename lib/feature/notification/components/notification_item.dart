import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../assets/assets.gen.dart';
import '../../../library/core/domain/entity/notification_domain.dart';

class NotificationItem extends StatelessWidget {
  final NotificationDomain notification;
  final Function(NotificationDomain notification) onDelete;

  const NotificationItem(
      {super.key, required this.notification, required this.onDelete});

  @override
  Widget build(BuildContext context) => Slidable(
      key: ValueKey(notification.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () => onDelete(notification)),
        children: [
          SlidableAction(
            onPressed: (_) => onDelete(notification),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFFFE4A49),
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: Spacing.small_w,
            right: Spacing.small_w,
            bottom: Spacing.small_h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: Spacing.small_w),
                  child: Assets.navNotify.svg(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        maxLines: 3,
                        style: context.text.titleMedium,
                      ),
                      SizedBox(
                        height: Spacing.extraExtraSmall_h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              notification.body,
                              maxLines: 3,
                              //overflow: TextOverflow.ellipsis,
                              style: context.text.bodySmall,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeago.format(notification.createdAt!),
                  style: context.text.labelSmall,
                )
              ],
            )
          ],
        ),
      ));
}
