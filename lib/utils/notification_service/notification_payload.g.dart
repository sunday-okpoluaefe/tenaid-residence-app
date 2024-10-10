// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) =>
    NotificationPayload(
      type: json['type'] as String,
      title: json['title'] as String,
      community: json['community'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      contentId: json['contentId'] as String?,
    );

Map<String, dynamic> _$NotificationPayloadToJson(
        NotificationPayload instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'description': instance.description,
      'community': instance.community,
      'link': instance.link,
      'contentId': instance.contentId,
    };
