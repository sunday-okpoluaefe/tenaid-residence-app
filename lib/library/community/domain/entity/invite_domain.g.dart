// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteDomain call({
    AccountCommunityDomain? community,
    String? code,
    InviteType? type,
    String? name,
    String? purpose,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
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
    Object? community = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? purpose = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return InviteDomain(
      community: community == const $CopyWithPlaceholder() || community == null
          ? _value.community
          // ignore: cast_nullable_to_non_nullable
          : community as AccountCommunityDomain,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as InviteType,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      purpose: purpose == const $CopyWithPlaceholder()
          ? _value.purpose
          // ignore: cast_nullable_to_non_nullable
          : purpose as String?,
      startDate: startDate == const $CopyWithPlaceholder() || startDate == null
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime,
      endDate: endDate == const $CopyWithPlaceholder() || endDate == null
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
    );
  }
}

extension $InviteDomainCopyWith on InviteDomain {
  /// Returns a callable class that can be used as follows: `instanceOfInviteDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteDomainCWProxy get copyWith => _$InviteDomainCWProxyImpl(this);
}
