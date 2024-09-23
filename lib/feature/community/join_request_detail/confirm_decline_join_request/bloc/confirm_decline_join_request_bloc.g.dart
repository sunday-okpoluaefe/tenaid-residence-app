// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_decline_join_request_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfirmDeclineJoinRequestStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmDeclineJoinRequestState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmDeclineJoinRequestState call({
    bool? loading,
    JoinRequestDomain? request,
    Resettable<ApiException>? error,
    Resettable<bool>? completed,
    String? reason,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfirmDeclineJoinRequestState.copyWith(...)`.
class _$ConfirmDeclineJoinRequestStateCWProxyImpl
    implements _$ConfirmDeclineJoinRequestStateCWProxy {
  const _$ConfirmDeclineJoinRequestStateCWProxyImpl(this._value);

  final ConfirmDeclineJoinRequestState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ConfirmDeclineJoinRequestState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfirmDeclineJoinRequestState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? request = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
  }) {
    return ConfirmDeclineJoinRequestState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      request: request == const $CopyWithPlaceholder()
          ? _value.request
          // ignore: cast_nullable_to_non_nullable
          : request as JoinRequestDomain?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<bool>?,
      reason: reason == const $CopyWithPlaceholder() || reason == null
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
    );
  }
}

extension $ConfirmDeclineJoinRequestStateCopyWith
    on ConfirmDeclineJoinRequestState {
  /// Returns a callable class that can be used as follows: `instanceOfConfirmDeclineJoinRequestState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfirmDeclineJoinRequestStateCWProxy get copyWith =>
      _$ConfirmDeclineJoinRequestStateCWProxyImpl(this);
}
