class Kyc {
  Kyc({
    bool? profileCompleted,
    bool? addressCompleted,
    bool? bankingCompleted,
  }) {
    _profileCompleted = profileCompleted;
    _addressCompleted = addressCompleted;
    _bankingCompleted = bankingCompleted;
  }

  Kyc.fromJson(dynamic json) {
    _profileCompleted = json['profileCompleted'];
    _addressCompleted = json['addressCompleted'];
    _bankingCompleted = json['bankingCompleted'];
  }

  bool? _profileCompleted;
  bool? _addressCompleted;
  bool? _bankingCompleted;

  Kyc copyWith({
    bool? profileCompleted,
    bool? addressCompleted,
    bool? bankingCompleted,
  }) =>
      Kyc(
        profileCompleted: profileCompleted ?? _profileCompleted,
        addressCompleted: addressCompleted ?? _addressCompleted,
        bankingCompleted: bankingCompleted ?? _bankingCompleted,
      );

  bool? get profileCompleted => _profileCompleted;

  bool? get addressCompleted => _addressCompleted;

  bool? get bankingCompleted => _bankingCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profileCompleted'] = _profileCompleted;
    map['addressCompleted'] = _addressCompleted;
    map['bankingCompleted'] = _bankingCompleted;
    return map;
  }
}
