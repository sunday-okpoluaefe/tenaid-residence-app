// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// LoginScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginScreenState call({
    bool? loading,
    Resettable<ApiException>? errorMessage,
    Resettable<bool>? signInComplete,
    bool? canContinue,
    bool? emailValidationError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginScreenState.copyWith(...)`.
class _$LoginScreenStateCWProxyImpl implements _$LoginScreenStateCWProxy {
  const _$LoginScreenStateCWProxyImpl(this._value);

  final LoginScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// LoginScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? signInComplete = const $CopyWithPlaceholder(),
    Object? canContinue = const $CopyWithPlaceholder(),
    Object? emailValidationError = const $CopyWithPlaceholder(),
  }) {
    return LoginScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      errorMessage:
          errorMessage == const $CopyWithPlaceholder() || errorMessage == null
              ? _value.errorMessage
              // ignore: cast_nullable_to_non_nullable
              : errorMessage as Resettable<ApiException>,
      signInComplete: signInComplete == const $CopyWithPlaceholder() ||
              signInComplete == null
          ? _value.signInComplete
          // ignore: cast_nullable_to_non_nullable
          : signInComplete as Resettable<bool>,
      canContinue:
          canContinue == const $CopyWithPlaceholder() || canContinue == null
              ? _value.canContinue
              // ignore: cast_nullable_to_non_nullable
              : canContinue as bool,
      emailValidationError:
          emailValidationError == const $CopyWithPlaceholder() ||
                  emailValidationError == null
              ? _value.emailValidationError
              // ignore: cast_nullable_to_non_nullable
              : emailValidationError as bool,
    );
  }
}

extension $LoginScreenStateCopyWith on LoginScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginScreenStateCWProxy get copyWith => _$LoginScreenStateCWProxyImpl(this);
}
