// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_address_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchAddressScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SearchAddressScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchAddressScreenState call({
    List<PlaceDomain>? results,
    bool? loading,
    Resettable<ApiException>? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchAddressScreenState.copyWith(...)`.
class _$SearchAddressScreenStateCWProxyImpl
    implements _$SearchAddressScreenStateCWProxy {
  const _$SearchAddressScreenStateCWProxyImpl(this._value);

  final SearchAddressScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SearchAddressScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchAddressScreenState call({
    Object? results = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SearchAddressScreenState(
      results: results == const $CopyWithPlaceholder() || results == null
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as List<PlaceDomain>,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
    );
  }
}

extension $SearchAddressScreenStateCopyWith on SearchAddressScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfSearchAddressScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchAddressScreenStateCWProxy get copyWith =>
      _$SearchAddressScreenStateCWProxyImpl(this);
}
