// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AccountDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountDomain call({
    String? id,
    String? lastName,
    DashboardFlagDomain? flags,
    String? firstName,
    String? country,
    String? gender,
    EmailDomain? email,
    AddressDomain? address,
    KycDomain? kyc,
    String? primaryAccountType,
    List<AccountTypeDomain>? accountTypes,
    bool? kycCompleted,
    String? phone,
    String? photo,
    String? dob,
    String? proofOfId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountDomain.copyWith(...)`.
class _$AccountDomainCWProxyImpl implements _$AccountDomainCWProxy {
  const _$AccountDomainCWProxyImpl(this._value);

  final AccountDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AccountDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountDomain call({
    Object? id = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? flags = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? kyc = const $CopyWithPlaceholder(),
    Object? primaryAccountType = const $CopyWithPlaceholder(),
    Object? accountTypes = const $CopyWithPlaceholder(),
    Object? kycCompleted = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
    Object? dob = const $CopyWithPlaceholder(),
    Object? proofOfId = const $CopyWithPlaceholder(),
  }) {
    return AccountDomain(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      flags: flags == const $CopyWithPlaceholder()
          ? _value.flags
          // ignore: cast_nullable_to_non_nullable
          : flags as DashboardFlagDomain?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as EmailDomain?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as AddressDomain?,
      kyc: kyc == const $CopyWithPlaceholder()
          ? _value.kyc
          // ignore: cast_nullable_to_non_nullable
          : kyc as KycDomain?,
      primaryAccountType: primaryAccountType == const $CopyWithPlaceholder()
          ? _value.primaryAccountType
          // ignore: cast_nullable_to_non_nullable
          : primaryAccountType as String?,
      accountTypes: accountTypes == const $CopyWithPlaceholder()
          ? _value.accountTypes
          // ignore: cast_nullable_to_non_nullable
          : accountTypes as List<AccountTypeDomain>?,
      kycCompleted: kycCompleted == const $CopyWithPlaceholder()
          ? _value.kycCompleted
          // ignore: cast_nullable_to_non_nullable
          : kycCompleted as bool?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
      dob: dob == const $CopyWithPlaceholder()
          ? _value.dob
          // ignore: cast_nullable_to_non_nullable
          : dob as String?,
      proofOfId: proofOfId == const $CopyWithPlaceholder()
          ? _value.proofOfId
          // ignore: cast_nullable_to_non_nullable
          : proofOfId as String?,
    );
  }
}

extension $AccountDomainCopyWith on AccountDomain {
  /// Returns a callable class that can be used as follows: `instanceOfAccountDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountDomainCWProxy get copyWith => _$AccountDomainCWProxyImpl(this);
}
