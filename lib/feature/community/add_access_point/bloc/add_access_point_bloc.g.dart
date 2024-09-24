// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_access_point_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddAccessPointStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AddAccessPointState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAccessPointState call({
    bool? loading,
    Resettable<ApiException>? error,
    bool? validated,
    Resettable<bool>? completed,
    String? name,
    String? description,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddAccessPointState.copyWith(...)`.
class _$AddAccessPointStateCWProxyImpl implements _$AddAccessPointStateCWProxy {
  const _$AddAccessPointStateCWProxyImpl(this._value);

  final AddAccessPointState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AddAccessPointState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAccessPointState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return AddAccessPointState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Resettable<ApiException>?,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as Resettable<bool>?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $AddAccessPointStateCopyWith on AddAccessPointState {
  /// Returns a callable class that can be used as follows: `instanceOfAddAccessPointState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$AddAccessPointStateCWProxy get copyWith =>
      _$AddAccessPointStateCWProxyImpl(this);
}
