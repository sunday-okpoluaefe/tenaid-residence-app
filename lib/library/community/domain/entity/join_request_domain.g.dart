// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinRequestDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinRequestDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinRequestDomain call({
    String? id,
    CommunityDomain? community,
    StreetDomain? street,
    String? description,
    AccountDomain? account,
    String? point,
    String? code,
    String? status,
    String? createdAt,
    String? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinRequestDomain.copyWith(...)`.
class _$JoinRequestDomainCWProxyImpl implements _$JoinRequestDomainCWProxy {
  const _$JoinRequestDomainCWProxyImpl(this._value);

  final JoinRequestDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinRequestDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinRequestDomain call({
    Object? id = const $CopyWithPlaceholder(),
    Object? community = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? point = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return JoinRequestDomain(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      community: community == const $CopyWithPlaceholder()
          ? _value.community
          // ignore: cast_nullable_to_non_nullable
          : community as CommunityDomain?,
      street: street == const $CopyWithPlaceholder()
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as StreetDomain?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as AccountDomain?,
      point: point == const $CopyWithPlaceholder()
          ? _value.point
          // ignore: cast_nullable_to_non_nullable
          : point as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String?,
    );
  }
}

extension $JoinRequestDomainCopyWith on JoinRequestDomain {
  /// Returns a callable class that can be used as follows: `instanceOfJoinRequestDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinRequestDomainCWProxy get copyWith =>
      _$JoinRequestDomainCWProxyImpl(this);
}
