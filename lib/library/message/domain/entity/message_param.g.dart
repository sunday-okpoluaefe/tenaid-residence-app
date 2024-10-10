// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_param.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageParamCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MessageParam(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageParam call({
    String? messageId,
    String? body,
    String? date,
    String? description,
    String? type,
    String? repliedTo,
    String? community,
    String? author,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageParam.copyWith(...)`.
class _$MessageParamCWProxyImpl implements _$MessageParamCWProxy {
  const _$MessageParamCWProxyImpl(this._value);

  final MessageParam _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MessageParam(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageParam call({
    Object? messageId = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? repliedTo = const $CopyWithPlaceholder(),
    Object? community = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
  }) {
    return MessageParam(
      messageId: messageId == const $CopyWithPlaceholder() || messageId == null
          ? _value.messageId
          // ignore: cast_nullable_to_non_nullable
          : messageId as String,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      repliedTo: repliedTo == const $CopyWithPlaceholder()
          ? _value.repliedTo
          // ignore: cast_nullable_to_non_nullable
          : repliedTo as String?,
      community: community == const $CopyWithPlaceholder() || community == null
          ? _value.community
          // ignore: cast_nullable_to_non_nullable
          : community as String,
      author: author == const $CopyWithPlaceholder() || author == null
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String,
    );
  }
}

extension $MessageParamCopyWith on MessageParam {
  /// Returns a callable class that can be used as follows: `instanceOfMessageParam.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageParamCWProxy get copyWith => _$MessageParamCWProxyImpl(this);
}
