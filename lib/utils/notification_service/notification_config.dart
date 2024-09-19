import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../network.dart';
import 'notification_handler.dart';

Future sendDevicePushToken() async {
  // only run when there is internet connection
  if (await NetworkUtil.hasConnectivity()) {
    FirebaseMessaging.instance.getToken().then(onTokenUpdated);

    if (Platform.isIOS)
      FirebaseMessaging.instance.getAPNSToken().then(onTokenUpdated);
  }
}

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
