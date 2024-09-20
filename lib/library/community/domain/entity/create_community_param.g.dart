// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_community_param.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateCommunityParamCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityParam(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityParam call({
    String? name,
    String? description,
    String? type,
    AddressDomain? address,
    List<String>? images,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateCommunityParam.copyWith(...)`.
class _$CreateCommunityParamCWProxyImpl
    implements _$CreateCommunityParamCWProxy {
  const _$CreateCommunityParamCWProxyImpl(this._value);

  final CreateCommunityParam _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityParam(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityParam call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
  }) {
    return CreateCommunityParam(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as AddressDomain?,
      images: images == const $CopyWithPlaceholder() || images == null
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<String>,
    );
  }
}

extension $CreateCommunityParamCopyWith on CreateCommunityParam {
  /// Returns a callable class that can be used as follows: `instanceOfCreateCommunityParam.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateCommunityParamCWProxy get copyWith =>
      _$CreateCommunityParamCWProxyImpl(this);
}
