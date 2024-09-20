// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification(
      title: json['title'] as String?,
      body: json['body'] as String?,
      read: json['read'] as bool,
      type: json['type'] as String?,
    )..createdAt = json['createdAt'] as String;

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
