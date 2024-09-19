// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CountryDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CountryDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  CountryDomain call({
    String? name,
    String? code,
    String? dialCode,
    String? flag,
    CurrencyDomain? currency,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCountryDomain.copyWith(...)`.
class _$CountryDomainCWProxyImpl implements _$CountryDomainCWProxy {
  const _$CountryDomainCWProxyImpl(this._value);

  final CountryDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CountryDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  CountryDomain call({
    Object? name = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? dialCode = const $CopyWithPlaceholder(),
    Object? flag = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
  }) {
    return CountryDomain(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      dialCode: dialCode == const $CopyWithPlaceholder() || dialCode == null
          ? _value.dialCode
          // ignore: cast_nullable_to_non_nullable
          : dialCode as String,
      flag: flag == const $CopyWithPlaceholder() || flag == null
          ? _value.flag
          // ignore: cast_nullable_to_non_nullable
          : flag as String,
      currency: currency == const $CopyWithPlaceholder() || currency == null
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as CurrencyDomain,
    );
  }
}

extension $CountryDomainCopyWith on CountryDomain {
  /// Returns a callable class that can be used as follows: `instanceOfCountryDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CountryDomainCWProxy get copyWith => _$CountryDomainCWProxyImpl(this);
}
