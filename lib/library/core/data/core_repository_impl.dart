import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api.dart';
import 'package:tenaid_mobile/library/core/data/mapper/place_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/core/data/model/app_notification.dart';
import 'package:tenaid_mobile/library/core/data/model/place.dart';
import 'package:tenaid_mobile/library/core/domain/core_repository.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';
import 'package:tenaid_mobile/utils/worker.dart';

import 'mapper/notification_to_domain_mapper.dart';

late LazyBox NotificationBox;

@Injectable(as: CoreRepository)
class CoreRepositoryImpl implements CoreRepository {
  final Api api;
  final PlaceToDomainMapper mapper;
  final NotificationToDomainMapper notificationMapper;

  CoreRepositoryImpl(this.api, this.mapper, this.notificationMapper);

  @override
  Future<List<PlaceDomain>> searchAddress(String query) async {
    final Map<String, dynamic> data = Map();
    data['address'] = query;

    final response = await api(
        url: 'location/search', requestType: RequestType.get, params: data);

    return List<PlaceDomain>.from(response.data
        .map((json) => Place.fromJson(json))
        .map((p) => mapper.map(p)));
  }

  Future<AppNotification?> _getNotificationAt(int index) async {
    String? json = await NotificationBox.getAt(index);
    return (json?.isNotEmpty == true)
        ? AppNotification.fromJson(jsonDecode(json!))
        : null;
  }

  @override
  Future<List<NotificationDomain>> getNotifications() async {
    int length = await NotificationBox.length;
    List<NotificationDomain> notifications = [];
    if (length < 1) return notifications;

    for (int i = 0; i < length; i++) {
      AppNotification? data = await _getNotificationAt(i);
      if (data != null) notifications.add(notificationMapper.map(data));
    }

    return notifications;
  }

  @override
  Future<void> saveNotification(
      {required NotificationDomain notification}) async {
    AppNotification notify = AppNotification(
        title: notification.title,
        body: notification.body,
        read: false,
        type: notification.type);

    await NotificationBox.put(uniqueId(), jsonEncode(notify.toJson()));
  }
}
