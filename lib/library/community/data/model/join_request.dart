import 'package:tenaid_mobile/library/community/data/model/street.dart';

import '../../../account/data/model/account.dart';
import 'community.dart';

class JoinRequest {
  JoinRequest({
    this.id,
    this.community,
    this.path,
    this.description,
    this.extra,
    this.point,
    this.code,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  JoinRequest.fromJson(dynamic json) {
    id = json['_id'];
    community = json['community'] != null
        ? Community.fromJson(json['community'])
        : null;
    path = json['path'] != null ? Street.fromJson(json['path']) : null;
    description = json['description'];
    extra = json['extra'] != null ? Account.fromJson(json['extra']) : null;
    point = json['point'];
    code = json['code'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  Community? community;
  Street? path;
  String? description;
  Account? extra;
  String? point;
  String? code;
  String? status;
  String? createdAt;
  String? updatedAt;

  JoinRequest copyWith({
    String? id,
    Community? community,
    Street? path,
    String? description,
    Account? extra,
    String? point,
    String? code,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      JoinRequest(
        id: id ?? this.id,
        community: community ?? this.community,
        path: path ?? this.path,
        description: description ?? this.description,
        extra: extra ?? this.extra,
        point: point ?? this.point,
        code: code ?? this.code,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (community != null) {
      map['community'] = community?.toJson();
    }
    if (path != null) {
      map['path'] = path?.toJson();
    }
    map['description'] = description;
    if (extra != null) {
      map['extra'] = extra?.toJson();
    }
    map['point'] = point;
    map['code'] = code;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
