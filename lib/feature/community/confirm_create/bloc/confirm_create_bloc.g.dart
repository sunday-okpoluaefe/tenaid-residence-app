// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_create_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfirmCreateStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmCreateState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmCreateState call({
    bool? loading,
    Resettable<ApiException>? error,
    CreateCommunityParam? param,
    Resettable<bool>? completed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfirmCreateState.copyWith(...)`.
class _$ConfirmCreateStateCWProxyImpl implements _$ConfirmCreateStateCWProxy {
  const _$ConfirmCreateStateCWProxyImpl(this._value);

  final ConfirmCreateState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmCreateState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmCreateState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? param = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return ConfirmCreateState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      param: param == const $CopyWithPlaceholder()
          ? _value.param
          // ignore: cast_nullable_to_non_nullable
          : param as CreateCommunityParam?,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<bool>?,
    );
  }
}

extension $ConfirmCreateStateCopyWith on ConfirmCreateState {
  /// Returns a callable class that can be used as follows: `instanceOfConfirmCreateState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfirmCreateStateCWProxy get copyWith =>
      _$ConfirmCreateStateCWProxyImpl(this);
}
