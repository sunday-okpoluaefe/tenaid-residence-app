import 'access_point.dart';

class InviteActivity {
  InviteActivity({
    this.id,
    this.accessPoint,
    this.invite,
    this.code,
    this.date,
    this.type,
  });

  InviteActivity.fromJson(dynamic json) {
    id = json['_id'];
    accessPoint = json['accessPoint'] != null
        ? AccessPoint.fromJson(json['accessPoint'])
        : null;
    invite = json['invite'] != null ? Invite.fromJson(json['invite']) : null;
    code = json['code'];
    date = json['date'];
    type = json['type'];
  }

  String? id;
  AccessPoint? accessPoint;
  Invite? invite;
  String? code;
  String? date;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (accessPoint != null) {
      map['accessPoint'] = accessPoint?.toJson();
    }
    if (invite != null) {
      map['invite'] = invite?.toJson();
    }
    map['code'] = code;
    map['date'] = date;
    map['type'] = type;
    return map;
  }
}

class Invite {
  Invite({
    this.id,
    this.name,
    this.type,
    this.photo,
    this.date,
    this.code,
    this.start,
    this.end,
    this.reason,
  });

  Invite.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    date = json['date'];
    photo = json['photo'];
    code = json['code'];
    start = json['start'];
    end = json['end'];
    reason = json['reason'];
  }

  String? id;
  String? name;
  String? type;
  String? photo;
  String? date;
  String? code;
  String? start;
  String? end;
  String? reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['photo'] = photo;
    map['code'] = code;
    map['date'] = date;
    map['start'] = start;
    map['end'] = end;
    map['reason'] = reason;
    return map;
  }
}
