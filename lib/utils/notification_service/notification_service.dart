import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';

import 'notification_payload.dart';

const String MAIN_NOTIFICATION_CHANNEL_ID = 'MAIN_NOTIFICATION_CHANNEL';
const String MAIN_NOTIFICATION_CHANNEL_TITLE = 'App Important Notifications';

_notificationId() => DateTime.now().millisecondsSinceEpoch.remainder(100000);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  @pragma('vm:entry-point')
  static Future<void> onNotificationSelected(
      NotificationResponse payload) async {
    // navigate to a specific screen
  }

  static Future<NotificationResponse?> getBackgroundNotification() async {
    NotificationAppLaunchDetails? notification =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    return (notification != null && notification.didNotificationLaunchApp)
        ? notification.notificationResponse
        : null;
  }

  @pragma('vm:entry-point')
  static Future<void> onNotificationInBackgroundSelected(
      NotificationResponse payload) async {
    BaseNavigator navigator = BaseNavigator();
    navigator.toSelectCountry((x) {});
  }

  static AndroidNotificationChannel AppPriorityChannel =
      AndroidNotificationChannel(
    MAIN_NOTIFICATION_CHANNEL_ID, // id
    MAIN_NOTIFICATION_CHANNEL_TITLE, // title
    description: MAIN_NOTIFICATION_CHANNEL_TITLE, // description
    importance: Importance.high,
  );

  static AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          AppPriorityChannel.id,
          AppPriorityChannel.name,
          channelDescription: AppPriorityChannel.description);

  static DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentBanner: true,
          presentSound: true);

  static Future initializeLocalNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@drawable/icon'),
            iOS: DarwinInitializationSettings());

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse:
            onNotificationInBackgroundSelected,
        onDidReceiveNotificationResponse: onNotificationSelected);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(AppPriorityChannel);
  }

  static void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null && notification.body?.isNotEmpty == true) {
      Map<String, dynamic> json = jsonDecode(notification.body!);
      NotificationPayload payload = NotificationPayload.fromJson(json);

      flutterLocalNotificationsPlugin.show(
          _notificationId(),
          notification.title ?? "",
          payload.description,
          payload: notification.body,
          NotificationDetails(
              android: androidNotificationDetails,
              iOS: darwinNotificationDetails));
    }
  }
}
