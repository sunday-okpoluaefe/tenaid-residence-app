// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChangePasswordScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordScreenState call({
    bool? loading,
    bool? validated,
    Resettable<bool>? isComplete,
    String? password,
    bool? isValidConfirm,
    String? confirmPassword,
    Resettable<ApiException>? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChangePasswordScreenState.copyWith(...)`.
class _$ChangePasswordScreenStateCWProxyImpl
    implements _$ChangePasswordScreenStateCWProxy {
  const _$ChangePasswordScreenStateCWProxyImpl(this._value);

  final ChangePasswordScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
    Object? isComplete = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? isValidConfirm = const $CopyWithPlaceholder(),
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ChangePasswordScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
      isComplete: isComplete == const $CopyWithPlaceholder()
          ? _value.isComplete
          // ignore: cast_nullable_to_non_nullable
          : isComplete as Resettable<bool>?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      isValidConfirm: isValidConfirm == const $CopyWithPlaceholder() ||
              isValidConfirm == null
          ? _value.isValidConfirm
          // ignore: cast_nullable_to_non_nullable
          : isValidConfirm as bool,
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
    );
  }
}

extension $ChangePasswordScreenStateCopyWith on ChangePasswordScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfChangePasswordScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangePasswordScreenStateCWProxy get copyWith =>
      _$ChangePasswordScreenStateCWProxyImpl(this);
}
