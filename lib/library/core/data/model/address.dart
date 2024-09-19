class Address {
  Address({
    String? address,
    String? city,
    String? postalCode,
    String? country,
    String? proofOfAddress,
    String? latitude,
    String? longitude,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) {
    _address = address;
    _city = city;
    _postalCode = postalCode;
    _country = country;
    _proofOfAddress = proofOfAddress;
    _latitude = latitude;
    _longitude = longitude;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Address.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
    _postalCode = json['postalCode'];
    _country = json['country'];
    _proofOfAddress = json['proofOfAddress'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _address;
  String? _city;
  String? _postalCode;
  String? _country;
  String? _proofOfAddress;
  String? _latitude;
  String? _longitude;
  String? _id;
  String? _createdAt;
  String? _updatedAt;

  Address copyWith({
    String? address,
    String? city,
    String? postalCode,
    String? country,
    String? proofOfAddress,
    String? latitude,
    String? longitude,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) =>
      Address(
        address: address ?? _address,
        city: city ?? _city,
        postalCode: postalCode ?? _postalCode,
        country: country ?? _country,
        proofOfAddress: proofOfAddress ?? _proofOfAddress,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String? get address => _address;

  String? get city => _city;

  String? get postalCode => _postalCode;

  String? get country => _country;

  String? get proofOfAddress => _proofOfAddress;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  String? get id => _id;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['postalCode'] = _postalCode;
    map['country'] = _country;
    map['proofOfAddress'] = _proofOfAddress;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
