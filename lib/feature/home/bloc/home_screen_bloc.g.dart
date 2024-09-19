// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// HomeScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeScreenState call({
    bool? notificationGranted,
    int? selectedPage,
    Resettable<bool>? requestPermission,
    String? profilePhoto,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeScreenState.copyWith(...)`.
class _$HomeScreenStateCWProxyImpl implements _$HomeScreenStateCWProxy {
  const _$HomeScreenStateCWProxyImpl(this._value);

  final HomeScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// HomeScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeScreenState call({
    Object? notificationGranted = const $CopyWithPlaceholder(),
    Object? selectedPage = const $CopyWithPlaceholder(),
    Object? requestPermission = const $CopyWithPlaceholder(),
    Object? profilePhoto = const $CopyWithPlaceholder(),
  }) {
    return HomeScreenState(
      notificationGranted:
          notificationGranted == const $CopyWithPlaceholder() ||
                  notificationGranted == null
              ? _value.notificationGranted
              // ignore: cast_nullable_to_non_nullable
              : notificationGranted as bool,
      selectedPage:
          selectedPage == const $CopyWithPlaceholder() || selectedPage == null
              ? _value.selectedPage
              // ignore: cast_nullable_to_non_nullable
              : selectedPage as int,
      requestPermission: requestPermission == const $CopyWithPlaceholder()
          ? _value.requestPermission
          // ignore: cast_nullable_to_non_nullable
          : requestPermission as Resettable<bool>?,
      profilePhoto: profilePhoto == const $CopyWithPlaceholder()
          ? _value.profilePhoto
          // ignore: cast_nullable_to_non_nullable
          : profilePhoto as String?,
    );
  }
}

extension $HomeScreenStateCopyWith on HomeScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeScreenStateCWProxy get copyWith => _$HomeScreenStateCWProxyImpl(this);
}
