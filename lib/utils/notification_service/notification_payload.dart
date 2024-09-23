import 'package:json_annotation/json_annotation.dart';

part 'notification_payload.g.dart';

@JsonSerializable()
class NotificationPayload {
  final String type;
  final String description;
  final String link;
  final Map<String, dynamic>? extra;

  NotificationPayload(
      {required this.type,
      required this.description,
      required this.link,
      this.extra});

  factory NotificationPayload.fromJson(dynamic json) =>
      _$NotificationPayloadFromJson(json);
}
