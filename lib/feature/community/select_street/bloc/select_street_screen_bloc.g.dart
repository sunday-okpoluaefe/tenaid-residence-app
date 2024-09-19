// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_street_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectStreetScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SelectStreetScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectStreetScreenState call({
    List<StreetDomain>? results,
    bool? loading,
    Resettable<ApiException>? errorMessage,
    Resettable<StreetDomain>? itemSelected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectStreetScreenState.copyWith(...)`.
class _$SelectStreetScreenStateCWProxyImpl
    implements _$SelectStreetScreenStateCWProxy {
  const _$SelectStreetScreenStateCWProxyImpl(this._value);

  final SelectStreetScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SelectStreetScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectStreetScreenState call({
    Object? results = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? itemSelected = const $CopyWithPlaceholder(),
  }) {
    return SelectStreetScreenState(
      results: results == const $CopyWithPlaceholder() || results == null
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as List<StreetDomain>,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as Resettable<ApiException>?,
      itemSelected: itemSelected == const $CopyWithPlaceholder()
          ? _value.itemSelected
          // ignore: cast_nullable_to_non_nullable
          : itemSelected as Resettable<StreetDomain>?,
    );
  }
}

extension $SelectStreetScreenStateCopyWith on SelectStreetScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfSelectStreetScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectStreetScreenStateCWProxy get copyWith =>
      _$SelectStreetScreenStateCWProxyImpl(this);
}
