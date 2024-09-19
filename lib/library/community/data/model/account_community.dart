import 'package:tenaid_mobile/library/community/data/model/street.dart';

import 'community.dart';

class AccountCommunity {
  final String? id;
  final Community? community;
  final String? houseName;
  final String? code;
  final bool? isAdmin;
  final bool? isPrimary;
  final String? apartment;
  final String? status;
  final Street? street;

  AccountCommunity(
      {required this.id,
      required this.code,
      required this.isAdmin,
      required this.isPrimary,
      required this.status,
      required this.community,
      required this.houseName,
      required this.apartment,
      required this.street});

  factory AccountCommunity.fromJson(dynamic json) => AccountCommunity(
      id: json['_id'],
      code: json['code'],
      status: json['status'],
      isAdmin: json['isAdmin'],
      isPrimary: json['isPrimary'] != null ? json['isPrimary'] : false,
      community: Community.fromJson(json['community']),
      houseName: json['point'] ?? null,
      apartment: json['description'],
      street: json['path'] != null ? Street.fromJson(json['path']) : null);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['_id'] = id;
    map['code'] = code;
    map['status'] = status;
    map['isAdmin'] = isAdmin;
    map['point'] = houseName;
    map['isPrimary'] = isPrimary;
    map['description'] = apartment;
    if (community != null) map['community'] = community!.toJson();

    if (street != null) map['path'] = street!.toJson();
    return map;
  }
}
