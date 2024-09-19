// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditProfileScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// EditProfileScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditProfileScreenState call({
    bool? loading,
    Resettable<ApiException>? error,
    CountryDomain? selectedCountry,
    bool? initializing,
    Resettable<bool>? showProfile,
    AccountDomain? account,
    bool? validated,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditProfileScreenState.copyWith(...)`.
class _$EditProfileScreenStateCWProxyImpl
    implements _$EditProfileScreenStateCWProxy {
  const _$EditProfileScreenStateCWProxyImpl(this._value);

  final EditProfileScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// EditProfileScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditProfileScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? selectedCountry = const $CopyWithPlaceholder(),
    Object? initializing = const $CopyWithPlaceholder(),
    Object? showProfile = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
  }) {
    return EditProfileScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      selectedCountry: selectedCountry == const $CopyWithPlaceholder()
          ? _value.selectedCountry
          // ignore: cast_nullable_to_non_nullable
          : selectedCountry as CountryDomain?,
      initializing:
          initializing == const $CopyWithPlaceholder() || initializing == null
              ? _value.initializing
              // ignore: cast_nullable_to_non_nullable
              : initializing as bool,
      showProfile: showProfile == const $CopyWithPlaceholder()
          ? _value.showProfile
          // ignore: cast_nullable_to_non_nullable
          : showProfile as Resettable<bool>?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as AccountDomain?,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
    );
  }
}

extension $EditProfileScreenStateCopyWith on EditProfileScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfEditProfileScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$EditProfileScreenStateCWProxy get copyWith =>
      _$EditProfileScreenStateCWProxyImpl(this);
}
