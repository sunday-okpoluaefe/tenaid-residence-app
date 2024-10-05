// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_status_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InviteStatusStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteStatusState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteStatusState call({
    bool? loading,
    VisitorDomain? visitor,
    bool? hasError,
    Resettable<Pair<VisitorDomain, String>>? completed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInviteStatusState.copyWith(...)`.
class _$InviteStatusStateCWProxyImpl implements _$InviteStatusStateCWProxy {
  const _$InviteStatusStateCWProxyImpl(this._value);

  final InviteStatusState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// InviteStatusState(...).copyWith(id: 12, name: "My name")
  /// ````
  InviteStatusState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? visitor = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return InviteStatusState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      visitor: visitor == const $CopyWithPlaceholder()
          ? _value.visitor
          // ignore: cast_nullable_to_non_nullable
          : visitor as VisitorDomain?,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<Pair<VisitorDomain, String>>?,
    );
  }
}

extension $InviteStatusStateCopyWith on InviteStatusState {
  /// Returns a callable class that can be used as follows: `instanceOfInviteStatusState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$InviteStatusStateCWProxy get copyWith =>
      _$InviteStatusStateCWProxyImpl(this);
}
