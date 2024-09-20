// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_community_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateCommunityStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityState call({
    String? name,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateCommunityState.copyWith(...)`.
class _$CreateCommunityStateCWProxyImpl
    implements _$CreateCommunityStateCWProxy {
  const _$CreateCommunityStateCWProxyImpl(this._value);

  final CreateCommunityState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return CreateCommunityState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $CreateCommunityStateCopyWith on CreateCommunityState {
  /// Returns a callable class that can be used as follows: `instanceOfCreateCommunityState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateCommunityStateCWProxy get copyWith =>
      _$CreateCommunityStateCWProxyImpl(this);
}
