import 'package:tenaid_mobile/library/community/data/model/street.dart';

class Visitor {
  Visitor({
    String? id,
    Street? street,
    String? name,
    String? photo,
    String? code,
    String? date,
    String? start,
    String? end,
    String? reason,
    String? status,
  }) {
    _id = id;
    _street = street;
    _name = name;
    _photo = photo;
    _code = code;
    _date = date;
    _start = start;
    _end = end;
    _reason = reason;
    _status = status;
  }

  Visitor.fromJson(dynamic json) {
    _id = json['_id'];
    _street = json['path'] != null ? Street.fromJson(json['path']) : null;
    _name = json['name'];
    _photo = json['photo'];
    _date = json['date'];
    _code = json['code'];
    _start = json['start'];
    _end = json['end'];
    _reason = json['reason'];
    _status = json['status'];
  }

  String? _id;
  Street? _street;
  String? _name;
  String? _photo;
  String? _code;
  String? _start;
  String? _date;
  String? _end;
  String? _reason;
  String? _status;

  String? get id => _id;

  Street? get street => _street;

  String? get name => _name;

  String? get date => _date;

  String? get photo => _photo;

  String? get code => _code;

  String? get start => _start;

  String? get end => _end;

  String? get reason => _reason;

  String? get status => _status;

  DateTime get startDate => DateTime.parse(start!).toLocal();

  DateTime get endDate => DateTime.parse(end!).toLocal();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_street != null) {
      map['path'] = _street?.toJson();
    }
    map['name'] = _name;
    map['photo'] = _photo;
    map['code'] = _code;
    map['start'] = _start;
    map['date'] = _date;
    map['end'] = _end;
    map['reason'] = _reason;
    map['status'] = _status;
    return map;
  }
}
