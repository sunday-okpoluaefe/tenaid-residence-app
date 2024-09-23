// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_detail_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinRequestDetailStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinRequestDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinRequestDetailState call({
    bool? loading,
    bool? approving,
    Resettable<bool>? completed,
    Resettable<ApiException>? error,
    String? request,
    JoinRequestDomain? requestDetail,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinRequestDetailState.copyWith(...)`.
class _$JoinRequestDetailStateCWProxyImpl
    implements _$JoinRequestDetailStateCWProxy {
  const _$JoinRequestDetailStateCWProxyImpl(this._value);

  final JoinRequestDetailState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// JoinRequestDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinRequestDetailState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? approving = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? request = const $CopyWithPlaceholder(),
    Object? requestDetail = const $CopyWithPlaceholder(),
  }) {
    return JoinRequestDetailState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      approving: approving == const $CopyWithPlaceholder() || approving == null
          ? _value.approving
          // ignore: cast_nullable_to_non_nullable
          : approving as bool,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<bool>?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      request: request == const $CopyWithPlaceholder()
          ? _value.request
          // ignore: cast_nullable_to_non_nullable
          : request as String?,
      requestDetail: requestDetail == const $CopyWithPlaceholder()
          ? _value.requestDetail
          // ignore: cast_nullable_to_non_nullable
          : requestDetail as JoinRequestDomain?,
    );
  }
}

extension $JoinRequestDetailStateCopyWith on JoinRequestDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfJoinRequestDetailState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinRequestDetailStateCWProxy get copyWith =>
      _$JoinRequestDetailStateCWProxyImpl(this);
}
