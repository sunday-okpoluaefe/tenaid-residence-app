// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// NotificationScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationScreenState call({
    bool? loading,
    List<NotificationDomain>? notifications,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationScreenState.copyWith(...)`.
class _$NotificationScreenStateCWProxyImpl
    implements _$NotificationScreenStateCWProxy {
  const _$NotificationScreenStateCWProxyImpl(this._value);

  final NotificationScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// NotificationScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationScreenState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? notifications = const $CopyWithPlaceholder(),
  }) {
    return NotificationScreenState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      notifications:
          notifications == const $CopyWithPlaceholder() || notifications == null
              ? _value.notifications
              // ignore: cast_nullable_to_non_nullable
              : notifications as List<NotificationDomain>,
    );
  }
}

extension $NotificationScreenStateCopyWith on NotificationScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationScreenStateCWProxy get copyWith =>
      _$NotificationScreenStateCWProxyImpl(this);
}
