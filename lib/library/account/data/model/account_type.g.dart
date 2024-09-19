// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountType _$AccountTypeFromJson(Map<String, dynamic> json) => AccountType(
      type: json['type'] as String?,
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$AccountTypeToJson(AccountType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'approved': instance.approved,
    };
