// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CurrencyDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CurrencyDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrencyDomain call({
    String? name,
    String? code,
    String? symbol,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCurrencyDomain.copyWith(...)`.
class _$CurrencyDomainCWProxyImpl implements _$CurrencyDomainCWProxy {
  const _$CurrencyDomainCWProxyImpl(this._value);

  final CurrencyDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CurrencyDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrencyDomain call({
    Object? name = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? symbol = const $CopyWithPlaceholder(),
  }) {
    return CurrencyDomain(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      symbol: symbol == const $CopyWithPlaceholder() || symbol == null
          ? _value.symbol
          // ignore: cast_nullable_to_non_nullable
          : symbol as String,
    );
  }
}

extension $CurrencyDomainCopyWith on CurrencyDomain {
  /// Returns a callable class that can be used as follows: `instanceOfCurrencyDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CurrencyDomainCWProxy get copyWith => _$CurrencyDomainCWProxyImpl(this);
}
