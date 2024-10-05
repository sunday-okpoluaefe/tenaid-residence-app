// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_activity_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteActivityDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteActivityDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteActivityDomain call({
    String? id,
    AccessPointDomain? accessPoint,
    String? code,
    String? date,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteActivityDomain.copyWith(...)`.
class _$InviteActivityDomainCWProxyImpl
    implements _$InviteActivityDomainCWProxy {
  const _$InviteActivityDomainCWProxyImpl(this._value);

  final InviteActivityDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteActivityDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteActivityDomain call({
    Object? id = const $CopyWithPlaceholder(),
    Object? accessPoint = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return InviteActivityDomain(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      accessPoint: accessPoint == const $CopyWithPlaceholder()
          ? _value.accessPoint
          // ignore: cast_nullable_to_non_nullable
          : accessPoint as AccessPointDomain?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
    );
  }
}

extension $InviteActivityDomainCopyWith on InviteActivityDomain {
  /// Returns a callable class that can be used as follows: `instanceOfInviteActivityDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteActivityDomainCWProxy get copyWith =>
      _$InviteActivityDomainCWProxyImpl(this);
}

abstract class _$InviteDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteDomain call({
    String? id,
    String? name,
    String? type,
    String? photo,
    String? date,
    String? code,
    String? start,
    String? end,
    String? reason,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteDomain.copyWith(...)`.
class _$InviteDomainCWProxyImpl implements _$InviteDomainCWProxy {
  const _$InviteDomainCWProxyImpl(this._value);

  final InviteDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteDomain call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
  }) {
    return InviteDomain(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
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
    );
  }
}

extension $InviteDomainCopyWith on InviteDomain {
  /// Returns a callable class that can be used as follows: `instanceOfInviteDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteDomainCWProxy get copyWith => _$InviteDomainCWProxyImpl(this);
}
