class Email {
  Email({
    String? value,
    bool? verified,
  }) {
    _value = value;
    _verified = verified;
  }

  Email.fromJson(dynamic json) {
    _value = json['value'];
    _verified = json['verified'];
  }

  String? _value;
  bool? _verified;

  String? get value => _value;

  bool? get verified => _verified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['verified'] = _verified;
    return map;
  }
}