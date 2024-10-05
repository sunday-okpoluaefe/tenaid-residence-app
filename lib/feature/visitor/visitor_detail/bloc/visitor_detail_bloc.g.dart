// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_detail_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorDetailStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDetailState call({
    bool? loading,
    InviteDomain? invite,
    PaginatedResult? activities,
    bool? hasError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorDetailState.copyWith(...)`.
class _$VisitorDetailStateCWProxyImpl implements _$VisitorDetailStateCWProxy {
  const _$VisitorDetailStateCWProxyImpl(this._value);

  final VisitorDetailState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// VisitorDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDetailState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? invite = const $CopyWithPlaceholder(),
    Object? activities = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
  }) {
    return VisitorDetailState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      invite: invite == const $CopyWithPlaceholder()
          ? _value.invite
          // ignore: cast_nullable_to_non_nullable
          : invite as InviteDomain?,
      activities: activities == const $CopyWithPlaceholder()
          ? _value.activities
          // ignore: cast_nullable_to_non_nullable
          : activities as PaginatedResult?,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
    );
  }
}

extension $VisitorDetailStateCopyWith on VisitorDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorDetailState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorDetailStateCWProxy get copyWith =>
      _$VisitorDetailStateCWProxyImpl(this);
}
