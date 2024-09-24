// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_access_point_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommunityAccessPointStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityAccessPointState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityAccessPointState call({
    bool? loading,
    bool? error,
    List<AccessPointDomain>? accessPoints,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommunityAccessPointState.copyWith(...)`.
class _$CommunityAccessPointStateCWProxyImpl
    implements _$CommunityAccessPointStateCWProxy {
  const _$CommunityAccessPointStateCWProxyImpl(this._value);

  final CommunityAccessPointState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityAccessPointState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityAccessPointState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? accessPoints = const $CopyWithPlaceholder(),
  }) {
    return CommunityAccessPointState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as bool,
      accessPoints:
          accessPoints == const $CopyWithPlaceholder() || accessPoints == null
              ? _value.accessPoints
              // ignore: cast_nullable_to_non_nullable
              : accessPoints as List<AccessPointDomain>,
    );
  }
}

extension $CommunityAccessPointStateCopyWith on CommunityAccessPointState {
  /// Returns a callable class that can be used as follows: `instanceOfCommunityAccessPointState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CommunityAccessPointStateCWProxy get copyWith =>
      _$CommunityAccessPointStateCWProxyImpl(this);
}
