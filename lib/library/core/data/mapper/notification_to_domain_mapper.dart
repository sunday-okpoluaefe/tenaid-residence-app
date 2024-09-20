import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/data/model/app_notification.dart';
import 'package:tenaid_mobile/library/core/domain/entity/notification_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class NotificationToDomainMapper
    extends Mapper<AppNotification, NotificationDomain> {
  @override
  NotificationDomain map(AppNotification from) => NotificationDomain(
      title: from.title ?? "",
      body: from.body ?? "",
      read: from.read,
      createdAt: DateTime.parse(from.createdAt),
      type: from.type ?? "");
}
