// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDomain call({
    String? id,
    StreetDomain? street,
    String? name,
    String? photo,
    String? code,
    String? date,
    String? start,
    String? end,
    String? reason,
    String? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorDomain.copyWith(...)`.
class _$VisitorDomainCWProxyImpl implements _$VisitorDomainCWProxy {
  const _$VisitorDomainCWProxyImpl(this._value);

  final VisitorDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDomain call({
    Object? id = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return VisitorDomain(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      street: street == const $CopyWithPlaceholder()
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as StreetDomain?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as String?,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as String?,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
    );
  }
}

extension $VisitorDomainCopyWith on VisitorDomain {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorDomainCWProxy get copyWith => _$VisitorDomainCWProxyImpl(this);
}
