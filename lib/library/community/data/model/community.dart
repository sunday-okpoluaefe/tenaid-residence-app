import '../../../core/data/model/address.dart';

class Community {
  Community({
    String? id,
    String? name,
    String? description,
    String? code,
    num? members,
    String? type,
    List<dynamic>? images,
    Address? address,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _code = code;
    _members = members;
    _type = type;
    _images = images;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Community.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _code = json['code'];
    _members = json['members'];
    _type = json['type'];
    _images = json['images'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _code;
  num? _members;
  String? _type;
  List<dynamic>? _images;
  Address? _address;
  String? _createdAt;
  String? _updatedAt;

  Community copyWith({
    String? id,
    String? name,
    String? description,
    String? code,
    num? members,
    String? type,
    List<dynamic>? images,
    Address? address,
    String? createdAt,
    String? updatedAt,
  }) =>
      Community(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        code: code ?? _code,
        members: members ?? _members,
        type: type ?? _type,
        images: images ?? _images,
        address: address ?? _address,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String? get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get code => _code;

  num? get members => _members;

  String? get type => _type;

  List<dynamic>? get images => _images;

  Address? get address => _address;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['code'] = _code;
    map['members'] = _members;
    map['type'] = _type;
    map['images'] = _images;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
