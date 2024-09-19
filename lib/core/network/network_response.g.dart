// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponse _$NetworkResponseFromJson(Map<String, dynamic> json) =>
    NetworkResponse(
      json['data'],
      json['message'] as String,
      json['timestamp'] as String,
      json['path'] as String,
    );

Map<String, dynamic> _$NetworkResponseToJson(NetworkResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'path': instance.path,
    };
