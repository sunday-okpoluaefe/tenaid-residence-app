// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationDomainCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// NotificationDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationDomain call({
    String? title,
    String? body,
    bool? read,
    DateTime? createdAt,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationDomain.copyWith(...)`.
class _$NotificationDomainCWProxyImpl implements _$NotificationDomainCWProxy {
  const _$NotificationDomainCWProxyImpl(this._value);

  final NotificationDomain _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// NotificationDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationDomain call({
    Object? title = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? read = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return NotificationDomain(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      read: read == const $CopyWithPlaceholder() || read == null
          ? _value.read
          // ignore: cast_nullable_to_non_nullable
          : read as bool,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $NotificationDomainCopyWith on NotificationDomain {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationDomain.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationDomainCWProxy get copyWith =>
      _$NotificationDomainCWProxyImpl(this);
}
