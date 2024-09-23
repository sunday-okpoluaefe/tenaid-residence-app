// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_join_request_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PendingJoinRequestStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PendingJoinRequestState(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingJoinRequestState call({
    bool? loading,
    Resettable<PaginatedResult>? requests,
    Resettable<ApiException>? error,
    AccountCommunityDomain? primaryCommunity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPendingJoinRequestState.copyWith(...)`.
class _$PendingJoinRequestStateCWProxyImpl
    implements _$PendingJoinRequestStateCWProxy {
  const _$PendingJoinRequestStateCWProxyImpl(this._value);

  final PendingJoinRequestState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PendingJoinRequestState(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingJoinRequestState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? requests = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? primaryCommunity = const $CopyWithPlaceholder(),
  }) {
    return PendingJoinRequestState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      requests: requests == const $CopyWithPlaceholder()
          ? _value.requests
          // ignore: cast_nullable_to_non_nullable
          : requests as Resettable<PaginatedResult>?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      primaryCommunity: primaryCommunity == const $CopyWithPlaceholder()
          ? _value.primaryCommunity
          // ignore: cast_nullable_to_non_nullable
          : primaryCommunity as AccountCommunityDomain?,
    );
  }
}

extension $PendingJoinRequestStateCopyWith on PendingJoinRequestState {
  /// Returns a callable class that can be used as follows: `instanceOfPendingJoinRequestState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$PendingJoinRequestStateCWProxy get copyWith =>
      _$PendingJoinRequestStateCWProxyImpl(this);
}
