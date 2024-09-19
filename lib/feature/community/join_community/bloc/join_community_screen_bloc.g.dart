// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_community_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinCommunityScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinCommunityScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinCommunityScreenState call({
    CommunityDomain? selected,
    bool? loading,
    Resettable<bool>? errorMessage,
    Resettable<JoinCommunityNavState>? nav,
    bool? validated,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinCommunityScreenState.copyWith(...)`.
class _$JoinCommunityScreenStateCWProxyImpl
    implements _$JoinCommunityScreenStateCWProxy {
  const _$JoinCommunityScreenStateCWProxyImpl(this._value);

  final JoinCommunityScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinCommunityScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinCommunityScreenState call({
    Object? selected = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? nav = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
  }) {
    return JoinCommunityScreenState(
      selected: selected == const $CopyWithPlaceholder()
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as CommunityDomain?,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as Resettable<bool>?,
      nav: nav == const $CopyWithPlaceholder()
          ? _value.nav
          // ignore: cast_nullable_to_non_nullable
          : nav as Resettable<JoinCommunityNavState>?,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
    );
  }
}

extension $JoinCommunityScreenStateCopyWith on JoinCommunityScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfJoinCommunityScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinCommunityScreenStateCWProxy get copyWith =>
      _$JoinCommunityScreenStateCWProxyImpl(this);
}
