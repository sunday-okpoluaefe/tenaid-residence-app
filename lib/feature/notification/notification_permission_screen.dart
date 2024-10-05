import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../assets/assets.gen.dart';

class NotificationPermissionScreen extends AppStatefulWidget {
  final Function() onGranted;

  NotificationPermissionScreen(this.onGranted);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<NotificationPermissionScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Spacing.small_w, vertical: Spacing.small_h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Assets.notification.svg(fit: BoxFit.scaleDown, width: 256),
                  SizedBox(
                    height: Spacing.large_h,
                  ),
                  Text(
                    'Enable Notifications',
                    style: context.text.headlineSmall,
                  ),
                  SizedBox(
                    height: Spacing.small_h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.large_w),
                    child: Text(
                      'Get reminders on important updates and stay informed about any changes that happen',
                      textAlign: TextAlign.center,
                      style: context.text.bodyMedium,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Spacing.large_h,
              ),
              PrimaryButton(
                  title: 'Continue',
                  isBottomSheet: true,
                  onClick: () {
                    Permission.notification
                        .onGrantedCallback(() {})
                        .request()
                        .then((status) {
                      widget.onGranted();
                    });
                  })
            ],
          ),
        ),
      );
}
