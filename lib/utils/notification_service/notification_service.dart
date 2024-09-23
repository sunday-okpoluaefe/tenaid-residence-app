import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/library/core/data/core_repository_impl.dart';
import 'package:tenaid_mobile/library/core/data/model/app_notification.dart';
import 'package:tenaid_mobile/utils/route_utils/navigation_handler.dart';
import 'package:tenaid_mobile/utils/worker.dart';

import 'notification_payload.dart';

const String MAIN_NOTIFICATION_CHANNEL_ID = 'MAIN_NOTIFICATION_CHANNEL';
const String MAIN_NOTIFICATION_CHANNEL_TITLE = 'App Important Notifications';

_notificationId() => DateTime.now().millisecondsSinceEpoch.remainder(100000);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  @pragma('vm:entry-point')
  static Future<void> onNotificationSelected(
      NotificationResponse notificationResponse) async {
    // navigate to a specific screen
    handleNavigation(notificationResponse.payload);
  }

  static void handleNavigation(String? notificationPayload) {
    // navigate to a specific screen
    NavigationHandler navigationHandler = GetIt.instance.get();
    if (notificationPayload == null) return;

    Map<String, dynamic> json = jsonDecode(notificationPayload!);
    NotificationPayload payload = NotificationPayload.fromJson(json);
    navigationHandler.parse(route: payload.link, param: payload.extra ?? Map());
  }

  static Future<NotificationResponse?> getBackgroundNotification() async {
    NotificationAppLaunchDetails? notification =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    return (notification != null && notification.didNotificationLaunchApp)
        ? notification.notificationResponse
        : null;
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
        onDidReceiveNotificationResponse: onNotificationSelected);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(AppPriorityChannel);
  }

  static Future saveNotification(
      String title, NotificationPayload notification) async {
    AppNotification notify = AppNotification(
        title: title,
        body: notification.description,
        read: false,
        type: notification.type);

    await NotificationBox.put(uniqueId(), jsonEncode(notify.toJson()));
  }

  static void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null && notification.body?.isNotEmpty == true) {
      Map<String, dynamic> json = jsonDecode(notification.body!);
      NotificationPayload payload = NotificationPayload.fromJson(json);

      saveNotification(notification.title ?? "", payload);

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
