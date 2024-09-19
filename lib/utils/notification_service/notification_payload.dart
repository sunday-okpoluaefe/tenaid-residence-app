import 'package:json_annotation/json_annotation.dart';

part 'notification_payload.g.dart';

@JsonSerializable()
class NotificationPayload {
  final String type;
  final String description;
  final String link;

  NotificationPayload(
      {required this.type, required this.description, required this.link});

  factory NotificationPayload.fromJson(dynamic json) =>
      _$NotificationPayloadFromJson(json);
}
