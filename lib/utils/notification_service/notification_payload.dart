import 'package:json_annotation/json_annotation.dart';

part 'notification_payload.g.dart';

@JsonSerializable()
class NotificationPayload {
  final String type;
  final String description;
  final String community;
  final String link;
  final String? contentId;

  NotificationPayload(
      {required this.type,
      required this.community,
      required this.description,
      required this.link,
      this.contentId});

  factory NotificationPayload.fromJson(dynamic json) =>
      _$NotificationPayloadFromJson(json);
}
