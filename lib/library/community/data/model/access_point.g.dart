// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessPoint _$AccessPointFromJson(Map<String, dynamic> json) => AccessPoint(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccessPointToJson(AccessPoint instance) =>
    <String, dynamic>{
      'name': instance.name,
      '_id': instance.id,
      'description': instance.description,
    };
