// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) =>
    NotificationPayload(
      type: json['type'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationPayloadToJson(
        NotificationPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'link': instance.link,
      'extra': instance.extra,
    };
