// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_details_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteDetailsScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteDetailsScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteDetailsScreenState call({
    InviteDomain? invite,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteDetailsScreenState.copyWith(...)`.
class _$InviteDetailsScreenStateCWProxyImpl
    implements _$InviteDetailsScreenStateCWProxy {
  const _$InviteDetailsScreenStateCWProxyImpl(this._value);

  final InviteDetailsScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteDetailsScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteDetailsScreenState call({
    Object? invite = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return InviteDetailsScreenState(
      invite: invite == const $CopyWithPlaceholder()
          ? _value.invite
          // ignore: cast_nullable_to_non_nullable
          : invite as InviteDomain?,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $InviteDetailsScreenStateCopyWith on InviteDetailsScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfInviteDetailsScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteDetailsScreenStateCWProxy get copyWith =>
      _$InviteDetailsScreenStateCWProxyImpl(this);
}
