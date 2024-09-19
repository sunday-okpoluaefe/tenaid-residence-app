// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardFlag _$DashboardFlagFromJson(Map<String, dynamic> json) =>
    DashboardFlag(
      welcome: json['welcome'] as bool? ?? true,
      joinCommunity: json['joinCommunity'] as bool? ?? true,
      createCommunity: json['createCommunity'] as bool? ?? true,
      quickActions: json['quickActions'] as bool? ?? false,
    );

Map<String, dynamic> _$DashboardFlagToJson(DashboardFlag instance) =>
    <String, dynamic>{
      'welcome': instance.welcome,
      'joinCommunity': instance.joinCommunity,
      'createCommunity': instance.createCommunity,
      'quickActions': instance.quickActions,
    };
