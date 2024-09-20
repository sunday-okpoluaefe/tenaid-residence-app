// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignupScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignupScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupScreenState call({
    bool? loading,
    bool? validated,
    Country? selectedCountry,
    bool? lNameValidationError,
    bool? fNameValidationError,
    bool? emailValidationError,
    bool? phoneValidationError,
    Resettable<bool>? signUpComplete,
    Resettable<ApiException>? errorMessage,
    bool? passwordValidationError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignupScreenState.copyWith(...)`.
class _$SignupScreenStateCWProxyImpl implements _$SignupScreenStateCWProxy {
  const _$SignupScreenStateCWProxyImpl(this._value);

  final SignupScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SignupScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
    Object? selectedCountry = const $CopyWithPlaceholder(),
    Object? lNameValidationError = const $CopyWithPlaceholder(),
    Object? fNameValidationError = const $CopyWithPlaceholder(),
    Object? emailValidationError = const $CopyWithPlaceholder(),
    Object? phoneValidationError = const $CopyWithPlaceholder(),
    Object? signUpComplete = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? passwordValidationError = const $CopyWithPlaceholder(),
  }) {
    return SignupScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
      selectedCountry: selectedCountry == const $CopyWithPlaceholder()
          ? _value.selectedCountry
          // ignore: cast_nullable_to_non_nullable
          : selectedCountry as Country?,
      lNameValidationError:
          lNameValidationError == const $CopyWithPlaceholder() ||
                  lNameValidationError == null
              ? _value.lNameValidationError
              // ignore: cast_nullable_to_non_nullable
              : lNameValidationError as bool,
      fNameValidationError:
          fNameValidationError == const $CopyWithPlaceholder() ||
                  fNameValidationError == null
              ? _value.fNameValidationError
              // ignore: cast_nullable_to_non_nullable
              : fNameValidationError as bool,
      emailValidationError:
          emailValidationError == const $CopyWithPlaceholder() ||
                  emailValidationError == null
              ? _value.emailValidationError
              // ignore: cast_nullable_to_non_nullable
              : emailValidationError as bool,
      phoneValidationError:
          phoneValidationError == const $CopyWithPlaceholder() ||
                  phoneValidationError == null
              ? _value.phoneValidationError
              // ignore: cast_nullable_to_non_nullable
              : phoneValidationError as bool,
      signUpComplete: signUpComplete == const $CopyWithPlaceholder() ||
              signUpComplete == null
          ? _value.signUpComplete
          // ignore: cast_nullable_to_non_nullable
          : signUpComplete as Resettable<bool>,
      errorMessage:
          errorMessage == const $CopyWithPlaceholder() || errorMessage == null
              ? _value.errorMessage
              // ignore: cast_nullable_to_non_nullable
              : errorMessage as Resettable<ApiException>,
      passwordValidationError:
          passwordValidationError == const $CopyWithPlaceholder() ||
                  passwordValidationError == null
              ? _value.passwordValidationError
              // ignore: cast_nullable_to_non_nullable
              : passwordValidationError as bool,
    );
  }
}

extension $SignupScreenStateCopyWith on SignupScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfSignupScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SignupScreenStateCWProxy get copyWith =>
      _$SignupScreenStateCWProxyImpl(this);
}
