// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_community_street_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateCommunityStreetStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityStreetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityStreetState call({
    bool? loading,
    String? name,
    String? description,
    Resettable<ApiException>? error,
    Resettable<bool>? completed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateCommunityStreetState.copyWith(...)`.
class _$CreateCommunityStreetStateCWProxyImpl
    implements _$CreateCommunityStreetStateCWProxy {
  const _$CreateCommunityStreetStateCWProxyImpl(this._value);

  final CreateCommunityStreetState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CreateCommunityStreetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCommunityStreetState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return CreateCommunityStreetState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<bool>?,
    );
  }
}

extension $CreateCommunityStreetStateCopyWith on CreateCommunityStreetState {
  /// Returns a callable class that can be used as follows: `instanceOfCreateCommunityStreetState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateCommunityStreetStateCWProxy get copyWith =>
      _$CreateCommunityStreetStateCWProxyImpl(this);
}
