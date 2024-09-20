import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/place_domain.dart';

abstract class CoreRepository {
  Future<List<PlaceDomain>> searchAddress(String query);

  Future<void> saveNotification({required NotificationDomain notification});

  Future<List<NotificationDomain>> getNotifications();

  Future<String> uploadSingle(String file);

  Future<List<String>> uploadMultiple(List<String> files);
}
