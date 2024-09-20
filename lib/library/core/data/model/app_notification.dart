import 'package:json_annotation/json_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable()
class AppNotification {
  final String? title;
  final String? body;
  final bool read;
  final String? type;
  late String createdAt;

  AppNotification(
      {required this.title,
      required this.body,
      required this.read,
      required this.type}) {
    this.createdAt = DateTime.now().toIso8601String();
  }

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);

  factory AppNotification.fromJson(dynamic json) =>
      _$AppNotificationFromJson(json);
}
