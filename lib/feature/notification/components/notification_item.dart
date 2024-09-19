import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../assets/assets.gen.dart';
import '../../../ds/component/dot.dart';
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
            right: Spacing.small, top: Spacing.small, bottom: Spacing.small),
        color: notification.read
            ? context.color.surface
            : context.color.surfaceContainer,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Spacing.small),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        child: Assets.navNotify.svg(),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: Spacing.small,
                                  color: context.color.onSurface,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: Spacing.extraExtraSmall,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    notification.body,
                                    maxLines: 3,
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!notification.read)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 5.5,
                      child: Dot(
                        size: 5,
                        color: context.color.primary,
                      ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeago.format(notification.createdAt),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ));
}
