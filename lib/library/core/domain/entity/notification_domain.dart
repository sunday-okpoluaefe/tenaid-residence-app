import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/utils/worker.dart';

part 'notification_domain.g.dart';

@CopyWith(skipFields: true)
class NotificationDomain {
  final String title;
  final String body;
  final bool read;
  final String type;

  DateTime get createdAt => DateTime.now();

  String get id => uniqueId();

  NotificationDomain(
      {required this.title,
      required this.body,
      required this.read,
      required this.type});
}
