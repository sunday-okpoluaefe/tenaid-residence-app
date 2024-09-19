// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ProfileScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileScreenState call({
    bool? loading,
    bool? isLoggingOut,
    Resettable<bool>? showLogin,
    AccountDomain? account,
    Resettable<ApiException>? error,
    List<AccountCommunityDomain>? communities,
    AccountCommunityDomain? activeCommunity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileScreenState.copyWith(...)`.
class _$ProfileScreenStateCWProxyImpl implements _$ProfileScreenStateCWProxy {
  const _$ProfileScreenStateCWProxyImpl(this._value);

  final ProfileScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ProfileScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? isLoggingOut = const $CopyWithPlaceholder(),
    Object? showLogin = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? communities = const $CopyWithPlaceholder(),
    Object? activeCommunity = const $CopyWithPlaceholder(),
  }) {
    return ProfileScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      isLoggingOut:
          isLoggingOut == const $CopyWithPlaceholder() || isLoggingOut == null
              ? _value.isLoggingOut
              // ignore: cast_nullable_to_non_nullable
              : isLoggingOut as bool,
      showLogin: showLogin == const $CopyWithPlaceholder()
          ? _value.showLogin
          // ignore: cast_nullable_to_non_nullable
          : showLogin as Resettable<bool>?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as AccountDomain?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      communities: communities == const $CopyWithPlaceholder()
          ? _value.communities
          // ignore: cast_nullable_to_non_nullable
          : communities as List<AccountCommunityDomain>?,
      activeCommunity: activeCommunity == const $CopyWithPlaceholder()
          ? _value.activeCommunity
          // ignore: cast_nullable_to_non_nullable
          : activeCommunity as AccountCommunityDomain?,
    );
  }
}

extension $ProfileScreenStateCopyWith on ProfileScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileScreenStateCWProxy get copyWith =>
      _$ProfileScreenStateCWProxyImpl(this);
}
