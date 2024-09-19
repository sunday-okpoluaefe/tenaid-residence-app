// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_join_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfirmJoinScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmJoinScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmJoinScreenState call({
    bool? isPrimary,
    bool? loading,
    Resettable<ApiException>? error,
    Resettable<AccountCommunityDomain>? success,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfirmJoinScreenState.copyWith(...)`.
class _$ConfirmJoinScreenStateCWProxyImpl
    implements _$ConfirmJoinScreenStateCWProxy {
  const _$ConfirmJoinScreenStateCWProxyImpl(this._value);

  final ConfirmJoinScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmJoinScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmJoinScreenState call({
    Object? isPrimary = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? success = const $CopyWithPlaceholder(),
  }) {
    return ConfirmJoinScreenState(
      isPrimary: isPrimary == const $CopyWithPlaceholder() || isPrimary == null
          ? _value.isPrimary
          // ignore: cast_nullable_to_non_nullable
          : isPrimary as bool,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as Resettable<AccountCommunityDomain>?,
    );
  }
}

extension $ConfirmJoinScreenStateCopyWith on ConfirmJoinScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfConfirmJoinScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfirmJoinScreenStateCWProxy get copyWith =>
      _$ConfirmJoinScreenStateCWProxyImpl(this);
}
