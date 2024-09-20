// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_image_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommunityImageStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityImageState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityImageState call({
    List<String>? images,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommunityImageState.copyWith(...)`.
class _$CommunityImageStateCWProxyImpl implements _$CommunityImageStateCWProxy {
  const _$CommunityImageStateCWProxyImpl(this._value);

  final CommunityImageState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CommunityImageState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommunityImageState call({
    Object? images = const $CopyWithPlaceholder(),
  }) {
    return CommunityImageState(
      images: images == const $CopyWithPlaceholder() || images == null
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<String>,
    );
  }
}

extension $CommunityImageStateCopyWith on CommunityImageState {
  /// Returns a callable class that can be used as follows: `instanceOfCommunityImageState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CommunityImageStateCWProxy get copyWith =>
      _$CommunityImageStateCWProxyImpl(this);
}
