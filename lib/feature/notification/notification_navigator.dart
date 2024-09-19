import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';

import 'notification_permission_screen.dart';
import 'notification_screen.dart';

@injectable
class NotificationNavigator extends BaseNavigator {
  Future toPermissions(Function() onGranted) =>
      toScreen(screen: NotificationPermissionScreen(onGranted));

  Future toNotifications() => toScreen(screen: NotificationScreen());
}
