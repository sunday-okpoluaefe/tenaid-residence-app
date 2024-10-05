import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../network.dart';
import 'notification_handler.dart';

Future sendDevicePushToken() async {
  // only run when there is internet connection
  if (await NetworkUtil.hasConnectivity()) {
    try {
      String? token;
      if (Platform.isIOS) {
        token = await FirebaseMessaging.instance.getAPNSToken();
      } else {
        token = await FirebaseMessaging.instance.getToken();
      }

      onTokenUpdated(token);
    } catch (_) {}
  }
}

Future<void> subscribeToTopic({required String topic}) async =>
    await FirebaseMessaging.instance.subscribeToTopic(topic);

Future<void> unSubscribeFromTopic({required String topic}) async =>
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);

Future<void> setupFirebaseNotification() async {
  FirebaseMessaging.onMessage.listen(foregroundHandler);

  FirebaseMessaging.onMessageOpenedApp.listen(backgroundHandler);

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  // await FirebaseMessaging.instance
  //     .subscribeToTopic("${Config.shared.flavor.name}-global");

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
}
