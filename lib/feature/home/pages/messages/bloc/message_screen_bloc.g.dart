// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MessageScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageScreenState call({
    bool? loading,
    AuthorDomain? user,
    List<CommunityMessageDomain>? messages,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageScreenState.copyWith(...)`.
class _$MessageScreenStateCWProxyImpl implements _$MessageScreenStateCWProxy {
  const _$MessageScreenStateCWProxyImpl(this._value);

  final MessageScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MessageScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? messages = const $CopyWithPlaceholder(),
  }) {
    return MessageScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AuthorDomain?,
      messages: messages == const $CopyWithPlaceholder() || messages == null
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<CommunityMessageDomain>,
    );
  }
}

extension $MessageScreenStateCopyWith on MessageScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfMessageScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageScreenStateCWProxy get copyWith =>
      _$MessageScreenStateCWProxyImpl(this);
}
