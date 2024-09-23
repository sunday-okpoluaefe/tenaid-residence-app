// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_community_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListCommunityStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ListCommunityState(...).copyWith(id: 12, name: "My name")
  /// ````
  ListCommunityState call({
    bool? loading,
    List<AccountCommunityDomain>? communities,
    bool? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListCommunityState.copyWith(...)`.
class _$ListCommunityStateCWProxyImpl implements _$ListCommunityStateCWProxy {
  const _$ListCommunityStateCWProxyImpl(this._value);

  final ListCommunityState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ListCommunityState(...).copyWith(id: 12, name: "My name")
  /// ````
  ListCommunityState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? communities = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ListCommunityState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      communities:
          communities == const $CopyWithPlaceholder() || communities == null
              ? _value.communities
              // ignore: cast_nullable_to_non_nullable
              : communities as List<AccountCommunityDomain>,
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as bool,
    );
  }
}

extension $ListCommunityStateCopyWith on ListCommunityState {
  /// Returns a callable class that can be used as follows: `instanceOfListCommunityState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ListCommunityStateCWProxy get copyWith =>
      _$ListCommunityStateCWProxyImpl(this);
}
