// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_street_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommunityStreetStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityStreetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityStreetState call({
    bool? loading,
    Resettable<PaginatedResult>? results,
    bool? error,
    Resettable<ApiException>? errorMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommunityStreetState.copyWith(...)`.
class _$CommunityStreetStateCWProxyImpl
    implements _$CommunityStreetStateCWProxy {
  const _$CommunityStreetStateCWProxyImpl(this._value);

  final CommunityStreetState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityStreetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityStreetState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
  }) {
    return CommunityStreetState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      results: results == const $CopyWithPlaceholder()
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as Resettable<PaginatedResult>?,
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as Resettable<ApiException>?,
    );
  }
}

extension $CommunityStreetStateCopyWith on CommunityStreetState {
  /// Returns a callable class that can be used as follows: `instanceOfCommunityStreetState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CommunityStreetStateCWProxy get copyWith =>
      _$CommunityStreetStateCWProxyImpl(this);
}
