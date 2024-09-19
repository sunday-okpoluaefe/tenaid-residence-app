// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_address_screen_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MemberAddressScreenStateCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MemberAddressScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MemberAddressScreenState call({
    StreetDomain? selectedStreet,
    bool? validated,
    String? apartment,
    String? houseNumber,
    Resettable<bool>? showConfirmScreen,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMemberAddressScreenState.copyWith(...)`.
class _$MemberAddressScreenStateCWProxyImpl
    implements _$MemberAddressScreenStateCWProxy {
  const _$MemberAddressScreenStateCWProxyImpl(this._value);

  final MemberAddressScreenState _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MemberAddressScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  MemberAddressScreenState call({
    Object? selectedStreet = const $CopyWithPlaceholder(),
    Object? validated = const $CopyWithPlaceholder(),
    Object? apartment = const $CopyWithPlaceholder(),
    Object? houseNumber = const $CopyWithPlaceholder(),
    Object? showConfirmScreen = const $CopyWithPlaceholder(),
  }) {
    return MemberAddressScreenState(
      selectedStreet: selectedStreet == const $CopyWithPlaceholder()
          ? _value.selectedStreet
          // ignore: cast_nullable_to_non_nullable
          : selectedStreet as StreetDomain?,
      validated: validated == const $CopyWithPlaceholder() || validated == null
          ? _value.validated
          // ignore: cast_nullable_to_non_nullable
          : validated as bool,
      apartment: apartment == const $CopyWithPlaceholder()
          ? _value.apartment
          // ignore: cast_nullable_to_non_nullable
          : apartment as String?,
      houseNumber: houseNumber == const $CopyWithPlaceholder()
          ? _value.houseNumber
          // ignore: cast_nullable_to_non_nullable
          : houseNumber as String?,
      showConfirmScreen: showConfirmScreen == const $CopyWithPlaceholder()
          ? _value.showConfirmScreen
          // ignore: cast_nullable_to_non_nullable
          : showConfirmScreen as Resettable<bool>?,
    );
  }
}

extension $MemberAddressScreenStateCopyWith on MemberAddressScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfMemberAddressScreenState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$MemberAddressScreenStateCWProxy get copyWith =>
      _$MemberAddressScreenStateCWProxyImpl(this);
}
