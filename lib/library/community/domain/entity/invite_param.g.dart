// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_param.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteParamCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteParam(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteParam call({
    String? start,
    String? end,
    DateTime? startDate,
    DateTime? endDate,
    String? date,
    String? name,
    String? code,
    String? community,
    String? member,
    String? path,
    String? photo,
    String? reason,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteParam.copyWith(...)`.
class _$InviteParamCWProxyImpl implements _$InviteParamCWProxy {
  const _$InviteParamCWProxyImpl(this._value);

  final InviteParam _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteParam(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteParam call({
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? community = const $CopyWithPlaceholder(),
    Object? member = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return InviteParam(
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as String?,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      community: community == const $CopyWithPlaceholder()
          ? _value.community
          // ignore: cast_nullable_to_non_nullable
          : community as String?,
      member: member == const $CopyWithPlaceholder()
          ? _value.member
          // ignore: cast_nullable_to_non_nullable
          : member as String?,
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
    );
  }
}

extension $InviteParamCopyWith on InviteParam {
  /// Returns a callable class that can be used as follows: `instanceOfInviteParam.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteParamCWProxy get copyWith => _$InviteParamCWProxyImpl(this);
}
