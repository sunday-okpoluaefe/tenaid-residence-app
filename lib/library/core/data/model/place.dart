class Place {
  AddressDomain({
    String? name,
    String? address,
    num? latitude,
    num? longitude,
    List<String>? types,
  }) {
    _name = name;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _types = types;
  }

  Place.fromJson(dynamic json) {
    _name = json['name'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _types = json['types'] != null ? json['types'].cast<String>() : [];
  }

  String? _name;
  String? _address;
  num? _latitude;
  num? _longitude;
  List<String>? _types;

  String? get name => _name;

  String? get address => _address;

  num? get latitude => _latitude;

  num? get longitude => _longitude;

  List<String>? get types => _types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['types'] = _types;
    return map;
  }
}
