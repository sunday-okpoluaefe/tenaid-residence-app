// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit_visitor_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExitVisitorStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ExitVisitorState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExitVisitorState call({
    bool? loading,
    DateTime? startTime,
    Resettable<InviteDomain>? showDetailsScreen,
    Resettable<bool>? hasError,
    String? name,
    String? purpose,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExitVisitorState.copyWith(...)`.
class _$ExitVisitorStateCWProxyImpl implements _$ExitVisitorStateCWProxy {
  const _$ExitVisitorStateCWProxyImpl(this._value);

  final ExitVisitorState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ExitVisitorState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExitVisitorState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? startTime = const $CopyWithPlaceholder(),
    Object? showDetailsScreen = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? purpose = const $CopyWithPlaceholder(),
  }) {
    return ExitVisitorState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      startTime: startTime == const $CopyWithPlaceholder()
          ? _value.startTime
          // ignore: cast_nullable_to_non_nullable
          : startTime as DateTime?,
      showDetailsScreen: showDetailsScreen == const $CopyWithPlaceholder()
          ? _value.showDetailsScreen
          // ignore: cast_nullable_to_non_nullable
          : showDetailsScreen as Resettable<InviteDomain>?,
      hasError: hasError == const $CopyWithPlaceholder()
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as Resettable<bool>?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      purpose: purpose == const $CopyWithPlaceholder() || purpose == null
          ? _value.purpose
          // ignore: cast_nullable_to_non_nullable
          : purpose as String,
    );
  }
}

extension $ExitVisitorStateCopyWith on ExitVisitorState {
  /// Returns a callable class that can be used as follows: `instanceOfExitVisitorState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ExitVisitorStateCWProxy get copyWith => _$ExitVisitorStateCWProxyImpl(this);
}
