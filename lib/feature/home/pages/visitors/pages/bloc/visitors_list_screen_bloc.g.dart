// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_list_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorsListScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorsListScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorsListScreenState call({
    Resettable<PaginatedResult>? visitors,
    bool? loading,
    Resettable<ApiException>? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorsListScreenState.copyWith(...)`.
class _$VisitorsListScreenStateCWProxyImpl
    implements _$VisitorsListScreenStateCWProxy {
  const _$VisitorsListScreenStateCWProxyImpl(this._value);

  final VisitorsListScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorsListScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorsListScreenState call({
    Object? visitors = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return VisitorsListScreenState(
      visitors: visitors == const $CopyWithPlaceholder()
          ? _value.visitors
          // ignore: cast_nullable_to_non_nullable
          : visitors as Resettable<PaginatedResult>?,
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

extension $VisitorsListScreenStateCopyWith on VisitorsListScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorsListScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorsListScreenStateCWProxy get copyWith =>
      _$VisitorsListScreenStateCWProxyImpl(this);
}
