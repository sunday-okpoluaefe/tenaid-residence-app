// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_community_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchCommunityScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SearchCommunityScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchCommunityScreenState call({
    Resettable<ApiException>? error,
    List<CommunityDomain>? results,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchCommunityScreenState.copyWith(...)`.
class _$SearchCommunityScreenStateCWProxyImpl
    implements _$SearchCommunityScreenStateCWProxy {
  const _$SearchCommunityScreenStateCWProxyImpl(this._value);

  final SearchCommunityScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SearchCommunityScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchCommunityScreenState call({
    Object? error = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return SearchCommunityScreenState(
      error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>,
      results: results == const $CopyWithPlaceholder() || results == null
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as List<CommunityDomain>,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $SearchCommunityScreenStateCopyWith on SearchCommunityScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfSearchCommunityScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchCommunityScreenStateCWProxy get copyWith =>
      _$SearchCommunityScreenStateCWProxyImpl(this);
}
