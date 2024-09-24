import '../../../core/data/model/address.dart';
import 'account_type.dart';
import 'dashboard_flag.dart';
import 'email.dart';
import 'kyc.dart';

class Account {
  Account({
    String? id,
    String? lastName,
    String? country,
    String? firstName,
    Email? email,
    Address? address,
    Kyc? kyc,
    DashboardFlag? flags,
    String? primaryAccountType,
    List<AccountType>? accountTypes,
    bool? kycCompleted,
    String? phone,
    String? photo,
    String? dob,
    String? gender,
    String? proofOfId,
  }) {
    _id = id;
    _lastName = lastName;
    _country = country;
    _firstName = firstName;
    _email = email;
    _address = address;
    _kyc = kyc;
    _gender = gender;
    _flags = flags;
    _primaryAccountType = primaryAccountType;
    _accountTypes = accountTypes;
    _kycCompleted = kycCompleted;
    _phone = phone;
    _photo = photo;
    _dob = dob;
    _proofOfId = proofOfId;
  }

  Account.fromJson(dynamic json) {
    _id = json['id'];
    _country = json['country'];
    _lastName = json['lastName'];
    _flags = json['flags'] != null
        ? DashboardFlag.fromJson(json['flags'])
        : DashboardFlag();
    _firstName = json['firstName'];
    _email = json['email'] != null ? Email.fromJson(json['email']) : null;
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _kyc = json['kyc'] != null ? Kyc.fromJson(json['kyc']) : null;
    _primaryAccountType = json['primaryAccountType'];
    if (json['accountTypes'] != null) {
      _accountTypes = [];
      json['accountTypes'].forEach((v) {
        _accountTypes?.add(AccountType.fromJson(v));
      });
    }
    _kycCompleted = json['kycCompleted'];
    _phone = json['phone'];
    _gender = json['gender'];
    _photo = json['photo'];
    _dob = json['dob'];
    _proofOfId = json['proofOfId'];
  }

  String? _id;
  String? _country;
  String? _lastName;
  String? _firstName;
  String? _gender;
  Email? _email;
  Address? _address;
  Kyc? _kyc;
  DashboardFlag? _flags;
  String? _primaryAccountType;
  List<AccountType>? _accountTypes;
  bool? _kycCompleted;
  String? _phone;
  String? _photo;
  String? _dob;
  String? _proofOfId;

  String? get id => _id;

  String? get gender => _gender;

  String? get lastName => _lastName;

  String? get country => _country;

  String? get firstName => _firstName;

  Email? get email => _email;

  Address? get address => _address;

  DashboardFlag? get flags => _flags;

  Kyc? get kyc => _kyc;

  String? get primaryAccountType => _primaryAccountType;

  List<AccountType>? get accountTypes => _accountTypes;

  bool? get kycCompleted => _kycCompleted;

  String? get phone => _phone;

  String? get photo => _photo;

  String? get dob => _dob;

  String? get proofOfId => _proofOfId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lastName'] = _lastName;
    map['flags'] = _flags?.toJson();
    map['firstName'] = _firstName;
    if (_email != null) {
      map['email'] = _email?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_kyc != null) {
      map['kyc'] = _kyc?.toJson();
    }
    map['primaryAccountType'] = _primaryAccountType;
    if (_accountTypes != null) {
      map['accountTypes'] = _accountTypes?.map((v) => v).toList();
    }
    map['kycCompleted'] = _kycCompleted;
    map['phone'] = _phone;
    map['photo'] = _photo;
    map['dob'] = _dob;
    map['country'] = _country;
    map['proofOfId'] = _proofOfId;
    return map;
  }
}
