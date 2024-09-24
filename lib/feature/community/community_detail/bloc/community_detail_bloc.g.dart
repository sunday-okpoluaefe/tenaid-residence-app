// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommunityDetailStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityDetailState call({
    bool? loading,
    Resettable<ApiException>? error,
    AccountCommunityDomain? community,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommunityDetailState.copyWith(...)`.
class _$CommunityDetailStateCWProxyImpl
    implements _$CommunityDetailStateCWProxy {
  const _$CommunityDetailStateCWProxyImpl(this._value);

  final CommunityDetailState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityDetailState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? community = const $CopyWithPlaceholder(),
  }) {
    return CommunityDetailState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      community: community == const $CopyWithPlaceholder()
          ? _value.community
          // ignore: cast_nullable_to_non_nullable
          : community as AccountCommunityDomain?,
    );
  }
}

extension $CommunityDetailStateCopyWith on CommunityDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfCommunityDetailState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CommunityDetailStateCWProxy get copyWith =>
      _$CommunityDetailStateCWProxyImpl(this);
}
