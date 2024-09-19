import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../../library/account/domain/account_repository.dart';
import '../../library/core/data/local_cache.dart';
import '../../library/core/domain/cache.dart';
import '../xts/global_notifier.dart';
import 'notification_service.dart';

void onTokenUpdated(String? token) async {
  try {
    AccountRepository repository = GetIt.instance.get();
    LocalCache cache = LocalCache();
    String auth = await cache.getString(PREF_AUTHORIZATION_, "");

    if (auth.isEmpty) return;
    if (token != null && token.isNotEmpty)
      repository.sendDevicePushToken(token);
  } catch (_) {}
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  NotificationService.showNotification(message);
}

@pragma('vm:entry-point')
Future<void> foregroundHandler(RemoteMessage message) async {
  NotificationService.showNotification(message);
  syncRequiredNotifier.notify();
}
